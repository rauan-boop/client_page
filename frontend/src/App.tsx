import { useEffect, useMemo, useState, type FormEvent } from 'react'
import { Link, useLocation, useNavigate } from 'react-router-dom'
import {
  documentNumber,
  documentRoutes,
  documents,
  formatDate,
  resolveDocumentKind,
  type DocumentConfig,
  type DocumentKind,
} from './documents'
import { supabase, supabaseConfigError } from './supabase'

type DataRow = Record<string, unknown>

const contractDocumentKinds: DocumentKind[] = ['contract', 'act', 'consent']

function isSigned(config: DocumentConfig, row: DataRow): boolean {
  if (config.kind === 'sublease') {
    return typeof row[config.pdfField] === 'string' && row[config.pdfField] !== ''
  }
  const value = row[config.signedField]
  return config.kind === 'additional' ? value === true : Boolean(value)
}

function displayName(row: DataRow): string {
  const parts = [
    row.client_familiya,
    row.client_imya,
    row.client_otchestvo,
  ].filter((part): part is string => typeof part === 'string' && part.length > 0)
  return parts.join(' ')
}

function App() {
  const location = useLocation()
  const navigate = useNavigate()
  const params = useMemo(
    () => new URLSearchParams(location.search),
    [location.search],
  )
  const id = params.get('id')
  const linkType = params.get('type') ?? params.get('typ')
  const kind = resolveDocumentKind(location.pathname)
  const [row, setRow] = useState<DataRow | null>(null)
  const [loading, setLoading] = useState(Boolean(kind && id && supabase))
  const [error, setError] = useState<string | null>(null)
  const [code, setCode] = useState('')
  const [submitting, setSubmitting] = useState(false)
  const [signed, setSigned] = useState(false)

  useEffect(() => {
    if (location.pathname !== '/' || !linkType) return
    if (linkType === 'subarenda') {
      navigate(`/subarend${location.search}`, { replace: true })
    } else if (linkType === 'dop') {
      navigate(`/dop${location.search}`, { replace: true })
    } else {
      navigate(`/glavnayaStranica${location.search}`, { replace: true })
    }
  }, [linkType, location.pathname, location.search, navigate])

  useEffect(() => {
    if (!kind || !id || !supabase) {
      setRow(null)
      setLoading(false)
      setError(kind && !id ? 'В ссылке отсутствует идентификатор документа.' : null)
      return
    }

    let active = true
    setLoading(true)
    setError(null)
    setRow(null)
    setCode('')

    void Promise.resolve(
      supabase
        .from(documents[kind].table)
        .select('*')
        .eq('id', id)
        .maybeSingle(),
    )
      .then(({ data, error: queryError }) => {
        if (!active) return
        if (queryError) throw queryError
        if (!data) {
          setError('Документ не найден или ссылка больше не действует.')
          return
        }
        setRow(data as DataRow)
        const config = documents[kind]
        setSigned(isSigned(config, data as DataRow))
        if (config.viewedField) {
          void Promise.resolve(
            supabase
              .from(config.table)
              .update({ [config.viewedField]: true })
              .eq('id', id),
          )
            .then(({ error: updateError }) => {
              if (active && updateError) {
                setError(
                  `Не удалось записать просмотр документа: ${updateError.message}`,
                )
              }
            })
            .catch((updateError: unknown) => {
              if (active) {
                setError(
                  updateError instanceof Error
                    ? updateError.message
                    : 'Не удалось записать просмотр документа.',
                )
              }
            })
        }
      })
      .catch((queryError: unknown) => {
        if (active) {
          setError(
            queryError instanceof Error
              ? queryError.message
              : 'Не удалось загрузить документ.',
          )
        }
      })
      .finally(() => {
        if (active) setLoading(false)
      })

    return () => {
      active = false
    }
  }, [id, kind])

  async function signDocument(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    if (!kind || !id || !row || !supabase) return
    const config = documents[kind]
    if (code !== String(row[config.codeField] ?? '')) {
      setError('Код подписи не совпадает. Проверьте его и попробуйте снова.')
      return
    }
    if (kind === 'sublease' || !row[config.pdfField]) {
      setError(
        'Подписание временно отключено: генерация подписанного PDF еще не перенесена.',
      )
      return
    }
    setSubmitting(true)
    setError(null)
    try {
      const value =
        kind === 'additional' ? true : new Date().toISOString()
      const { data, error: updateError } = await supabase
        .from(config.table)
        .update({
          [config.codeField]: code,
          [config.signedField]: value,
        })
        .eq('id', id)
        .select('id')
        .maybeSingle()
      if (updateError) {
        setError(`Не удалось сохранить подписание: ${updateError.message}`)
        return
      }
      if (!data) {
        setError('Подписание не сохранено: запись недоступна для обновления.')
        return
      }
      setSigned(true)
    } catch (updateError: unknown) {
      setError(
        updateError instanceof Error
          ? `Не удалось сохранить подписание: ${updateError.message}`
          : 'Не удалось сохранить подписание.',
      )
    } finally {
      setSubmitting(false)
    }
  }

  if (supabaseConfigError) {
    return <Notice message={supabaseConfigError} />
  }

  if (loading) return <Notice message="Загружаем документ…" loading />
  if (error && !row && kind) return <Notice message={error} />
  if (kind) {
    if (!row) return <Notice message="Не удалось загрузить документ." />
    return (
      <DocumentPage
        kind={kind}
        row={row}
        signed={signed}
        code={code}
        setCode={setCode}
        submitting={submitting}
        error={error}
        onSubmit={signDocument}
      />
    )
  }
  if (location.pathname.toLowerCase() === '/glavnayastranica') {
    return <DocumentList id={id} />
  }
  if (location.pathname.toLowerCase() === '/dop') {
    return <AdditionalOverview id={id} />
  }
  if (location.pathname.toLowerCase() === '/dopsoglashenie') {
    return <AdditionalList id={id} />
  }
  if (location.pathname.toLowerCase() === '/subarend') {
    return <SubleaseLanding id={id} />
  }
  return (
    <Notice message="Откройте ссылку, полученную для подписания документа." />
  )
}

function DocumentPage(props: {
  kind: DocumentKind
  row: DataRow
  signed: boolean
  code: string
  setCode: (value: string) => void
  submitting: boolean
  error: string | null
  onSubmit: (event: FormEvent<HTMLFormElement>) => void
}) {
  const { kind, row, signed, code, setCode, submitting, error, onSubmit } = props
  const config = documents[kind]
  const pdfUrl =
    typeof row[config.pdfField] === 'string'
      ? (row[config.pdfField] as string)
      : ''
  const signingAvailable = Boolean(pdfUrl) && kind !== 'sublease'

  return (
    <main className="shell">
      <header className="brand">
        <div className="brand-mark">R</div>
        <div>
          <strong>R-CORE</strong>
          <span>Документы автопроката</span>
        </div>
      </header>
      <section className="panel document-panel">
        <p className="eyebrow">{signed ? 'Документ подписан' : 'Документ на подпись'}</p>
        <h1>{config.title}</h1>
        <p className="document-meta">
          {[documentNumber(row), formatDate(row.date_dogovora ?? row.created_at)]
            .filter(Boolean)
            .join(' · ')}
        </p>
        {displayName(row) && (
          <p className="client-name">{displayName(row)}</p>
        )}

        {pdfUrl ? (
          <div className="pdf-frame">
            <iframe title={config.title} src={pdfUrl} />
          </div>
        ) : (
          <div className="document-placeholder">
            <strong>Предварительный просмотр</strong>
            <p>
              PDF-файл будет доступен после переноса генерации документов из
              текущей версии сайта.
            </p>
          </div>
        )}

        {signed ? (
          <div className="success-message" role="status">
            {config.signedLabel}
          </div>
        ) : (
          <form className="sign-form" onSubmit={onSubmit}>
            {row[config.codeField] != null && (
              <p className="code-hint">
                Код для подписи: <strong>{String(row[config.codeField])}</strong>
              </p>
            )}
            <p className="consent-text">
              Введите код, чтобы подтвердить согласие с условиями документа.
            </p>
            <label htmlFor="sign-code">Код подписи</label>
            <input
              id="sign-code"
              inputMode="numeric"
              autoComplete="one-time-code"
              value={code}
              onChange={(event) => setCode(event.target.value)}
              required
            />
            {error && <p className="error-message" role="alert">{error}</p>}
            <button type="submit" disabled={submitting || !signingAvailable}>
              {submitting ? 'Сохраняем…' : 'Подписать документ'}
            </button>
            {!signingAvailable && (
              <p className="notice-text">
                Подписание станет доступно после переноса генерации PDF.
              </p>
            )}
          </form>
        )}
      </section>
      <footer>Документы предоставлены компанией R-CORE</footer>
    </main>
  )
}

function DocumentList({ id }: { id: string | null }) {
  const [row, setRow] = useState<DataRow | null>(null)
  const [message, setMessage] = useState('Загружаем список документов…')

  useEffect(() => {
    if (!id || !supabase) {
      setMessage('Ссылка не содержит идентификатор договора.')
      return
    }
    let active = true
    void Promise.resolve(
      supabase.from('contracts').select('*').eq('id', id).maybeSingle(),
    )
      .then(({ data, error }) => {
        if (!active) return
        if (error) {
          setMessage(error.message)
          return
        }
        if (!data) {
          setMessage('Договор не найден или ссылка больше не действует.')
          return
        }
        setRow(data as DataRow)
        setMessage('')
      })
      .catch((queryError: unknown) => {
        if (active) {
          setMessage(
            queryError instanceof Error
              ? queryError.message
              : 'Не удалось загрузить список документов.',
          )
        }
      })
    return () => {
      active = false
    }
  }, [id])

  if (!row) return <Notice message={message} loading={message.startsWith('Загружаем')} />

  return (
    <main className="shell">
      <Brand />
      <section className="panel">
        <p className="eyebrow">Документы для ознакомления и подписания</p>
        <h1>Здравствуйте{displayName(row) ? `, ${displayName(row)}` : ''}</h1>
        <p className="document-meta">
          {documentNumber(row)} · {formatDate(row.date_dogovora)}
        </p>
        <div className="document-list">
          {contractDocumentKinds.map((kind) => (
            <DocumentLink key={kind} kind={kind} id={id!} row={row} />
          ))}
        </div>
        <Link className="secondary-link" to={`/dopSoglashenie?id=${encodeURIComponent(id!)}`}>
          Дополнительные соглашения
        </Link>
      </section>
      <footer>Документы предоставлены компанией R-CORE</footer>
    </main>
  )
}

function AdditionalOverview({ id }: { id: string | null }) {
  const [row, setRow] = useState<DataRow | null>(null)
  const [message, setMessage] = useState('Загружаем дополнительное соглашение…')

  useEffect(() => {
    if (!id || !supabase) {
      setMessage('Ссылка не содержит идентификатор соглашения.')
      return
    }
    let active = true
    void Promise.resolve(
      supabase
        .from('dop_soglachenie')
        .select('*')
        .eq('id', id)
        .maybeSingle(),
    )
      .then(({ data, error }) => {
        if (!active) return
        if (error) {
          setMessage(error.message)
          return
        }
        if (!data) {
          setMessage('Соглашение не найдено или ссылка больше не действует.')
          return
        }
        setRow(data as DataRow)
        setMessage('')
      })
      .catch((queryError: unknown) => {
        if (active) {
          setMessage(
            queryError instanceof Error
              ? queryError.message
              : 'Не удалось загрузить соглашение.',
          )
        }
      })
    return () => {
      active = false
    }
  }, [id])

  if (!row) {
    return <Notice message={message} loading={message.startsWith('Загружаем')} />
  }
  return (
    <main className="shell">
      <Brand />
      <section className="panel">
        <p className="eyebrow">Дополнительное соглашение</p>
        <h1>{documents.additional.title}</h1>
        <p className="document-meta">{documentNumber(row)}</p>
        <DocumentLink kind="additional" id={String(row.id)} row={row} />
      </section>
    </main>
  )
}

function AdditionalList({ id }: { id: string | null }) {
  const [rows, setRows] = useState<DataRow[]>([])
  const [message, setMessage] = useState('Загружаем дополнительные соглашения…')

  useEffect(() => {
    if (!id || !supabase) {
      setMessage('Ссылка не содержит идентификатор договора.')
      return
    }
    let active = true
    void Promise.resolve(
      supabase
        .from('dop_soglachenie')
        .select('*')
        .eq('id_dogovora', id),
    )
      .then(({ data, error }) => {
        if (!active) return
        if (error) {
          setMessage(error.message)
          return
        }
        setRows((data ?? []) as DataRow[])
        setMessage('')
      })
      .catch((queryError: unknown) => {
        if (active) {
          setMessage(
            queryError instanceof Error
              ? queryError.message
              : 'Не удалось загрузить дополнительные соглашения.',
          )
        }
      })
    return () => {
      active = false
    }
  }, [id])

  if (message) return <Notice message={message} loading={message.startsWith('Загружаем')} />
  return (
    <main className="shell">
      <Brand />
      <section className="panel">
        <h1>Дополнительные соглашения</h1>
        {rows.length ? (
          <div className="document-list">
            {rows.map((row) => (
              <DocumentLink
                key={String(row.id)}
                kind="additional"
                id={String(row.id)}
                row={row}
              />
            ))}
          </div>
        ) : (
          <p>Дополнительных соглашений нет.</p>
        )}
      </section>
    </main>
  )
}

function SubleaseLanding({ id }: { id: string | null }) {
  return (
    <main className="shell">
      <Brand />
      <section className="panel">
        <h1>Договор субаренды</h1>
        <p>Откройте документ для ознакомления и подписания.</p>
        {id ? (
          <Link className="document-link" to={`/subarenda?id=${encodeURIComponent(id)}`}>
            Перейти к договору субаренды
          </Link>
        ) : (
          <p className="error-message">В ссылке отсутствует идентификатор документа.</p>
        )}
      </section>
    </main>
  )
}

function DocumentLink({
  kind,
  id,
  row,
}: {
  kind: DocumentKind
  id: string
  row: DataRow
}) {
  const config = documents[kind]
  const date = formatDate(row.date_dogovora ?? row.created_at)
  const title = `${config.title}${documentNumber(row) ? ` — ${documentNumber(row)}` : ''}`
  return (
    <Link
      className="document-link"
      to={`${documentRoutes[kind]}?id=${encodeURIComponent(id)}`}
    >
      <span>
        <strong>{title}</strong>
        {date && <small>{date}</small>}
      </span>
      <span className={isSigned(config, row) ? 'status signed' : 'status'}>
        {isSigned(config, row) ? 'Подписан' : 'Открыть'}
      </span>
    </Link>
  )
}

function Brand() {
  return (
    <header className="brand">
      <div className="brand-mark">R</div>
      <div>
        <strong>R-CORE</strong>
        <span>Документы автопроката</span>
      </div>
    </header>
  )
}

function Notice({ message, loading = false }: { message: string; loading?: boolean }) {
  return (
    <main className="shell notice-shell">
      <Brand />
      <section className="panel notice-panel">
        {loading && <span className="loader" aria-hidden="true" />}
        <p role={loading ? 'status' : 'alert'}>{message}</p>
      </section>
      <footer>Документы предоставлены компанией R-CORE</footer>
    </main>
  )
}

export default App
