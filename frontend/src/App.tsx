import { useEffect, useMemo, useRef, useState } from 'react'
import { Link, useLocation, useNavigate } from 'react-router-dom'
import { QRSigningClientCMS } from 'sigex-qr-signing-client'
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
function isDataRow(value: unknown): value is DataRow {
  return value !== null && typeof value === 'object' && !Array.isArray(value)
}

const selectFields: Record<DocumentKind, string> = {
  contract:
    'id,nomer_dogovora,date_dogovora,created_at,client_familiya,client_imya,client_otchestvo,dogovor_url,dogovor_podpisan,dogovor_sigex_url,viewed_dogovor,act_priema_url,act_podpisan,viewed_act,soglasie_na_straf_url,soglasie_podpisano,viewed_soglasie',
  act: 'id,nomer_dogovora,date_dogovora,created_at,client_familiya,client_imya,client_otchestvo,act_priema_url,act_podpisan,viewed_act',
  consent:
    'id,nomer_dogovora,date_dogovora,created_at,client_familiya,client_imya,client_otchestvo,soglasie_na_straf_url,soglasie_podpisano,viewed_soglasie',
  additional:
    'id,created_at,date_dogovora,nomer_dogovora,nomer_dop_soglasheniya,url_dop_soglasheniya,status_podpisi_clienta',
  sublease: 'id,created_at,dogovor_url,viewed_dogovor',
}
const previewContract: DataRow = {
  id: 'preview',
  nomer_dogovora: 'R-2026-0142',
  date_dogovora: '2026-10-27T00:00:00.000Z',
  created_at: '2026-10-27T00:00:00.000Z',
  company_name: 'ТОО «Пример компании»',
  client_familiya: 'Иванов',
  client_imya: 'Александр',
  client_otchestvo: 'Сергеевич',
  dogovor_url: null,
  act_priema_url: null,
  soglasie_na_straf_url: null,
  dogovor_podpisan: null,
  act_podpisan: null,
  soglasie_podpisano: null,
}
const previewAdditional: DataRow = {
  id: 'preview-additional',
  nomer_dogovora: 'R-2026-0142',
  nomer_dop_soglasheniya: 'ДС-03',
  date_dogovora: '2026-10-27T00:00:00.000Z',
  created_at: '2026-10-27T00:00:00.000Z',
  data_client: 'Александр Иванов',
  url_dop_soglasheniya: null,
  status_podpisi_clienta: false,
}
const previewAdditionalRows = [previewAdditional]

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
  const isPreview = params.get('preview') === '1'
  const linkType = params.get('type') ?? params.get('typ')
  const kind = resolveDocumentKind(location.pathname)
  const [row, setRow] = useState<DataRow | null>(null)
  const [loading, setLoading] = useState(Boolean(kind && id && supabase))
  const [error, setError] = useState<string | null>(null)
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
    const client = supabase
    if (isPreview && kind) {
      setRow(kind === 'additional'
        ? previewAdditional
        : kind === 'sublease'
          ? {
              id: 'preview-sublease',
              nomer_dogovora: 'R-2026-0142',
              created_at: '2026-10-27T00:00:00.000Z',
              dogovor_url: null,
              viewed_dogovor: false,
            }
          : previewContract)
      setSigned(false)
      setLoading(false)
      setError(null)
      return
    }
    if (!kind || !id || !client) {
      setRow(null)
      setLoading(false)
      setError(kind && !id ? 'В ссылке отсутствует идентификатор документа.' : null)
      return
    }

    let active = true
    setLoading(true)
    setError(null)
    setRow(null)

    void Promise.resolve(
      client
        .from(documents[kind].table)
        .select(selectFields[kind])
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
        if (!isDataRow(data)) {
          setError('Данные документа имеют неверный формат.')
          return
        }
        setRow(data)
        const config = documents[kind]
        setSigned(isSigned(config, data))
        if (config.viewedField) {
          void Promise.resolve(
            client
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
  }, [id, isPreview, kind])

  if (supabaseConfigError && !isPreview) {
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
        isPreview={isPreview}
        error={error}
        onSigexSigned={(url) => {
          setRow((currentRow) =>
            currentRow ? { ...currentRow, dogovor_sigex_url: url } : currentRow,
          )
          setSigned(true)
        }}
      />
    )
  }
  if (location.pathname.toLowerCase() === '/glavnayastranica') {
    return isPreview ? (
      <DocumentList id="preview" previewRow={previewContract} />
    ) : (
      <DocumentList id={id} />
    )
  }
  if (location.pathname.toLowerCase() === '/dop') {
    return isPreview ? (
      <AdditionalOverview
        id="preview-additional"
        previewRow={previewAdditional}
      />
    ) : (
      <AdditionalOverview id={id} />
    )
  }
  if (location.pathname.toLowerCase() === '/dopsoglashenie') {
    return isPreview ? (
      <AdditionalList
        id="preview"
        previewRows={previewAdditionalRows}
      />
    ) : (
      <AdditionalList id={id} />
    )
  }
  if (location.pathname.toLowerCase() === '/subarend') {
    return <SubleaseLanding id={isPreview ? 'preview' : id} />
  }
  return (
    <Notice message="Откройте ссылку, полученную для подписания документа." />
  )
}

function DocumentPage(props: {
  kind: DocumentKind
  row: DataRow
  signed: boolean
  isPreview: boolean
  error: string | null
  onSigexSigned: (url: string) => void
}) {
  const {
    kind,
    row,
    signed,
    isPreview,
    error,
    onSigexSigned,
  } = props
  const [sigexPhase, setSigexPhase] = useState<
    'idle' | 'preparing' | 'ready' | 'waiting' | 'saving' | 'error'
  >('idle')
  const [sigexError, setSigexError] = useState<string | null>(null)
  const [sigexLink, setSigexLink] = useState<string | null>(null)
  const [sigexEvidenceUrl, setSigexEvidenceUrl] = useState<string | null>(null)
  const signerRef = useRef<QRSigningClientCMS | null>(null)
  const signatureRequestRef = useRef<Promise<string[]> | null>(null)
  const config = documents[kind]
  const pdfUrl =
    typeof row[config.pdfField] === 'string'
      ? (row[config.pdfField] as string)
      : ''
  const sigexSigned =
    kind === 'contract' &&
    typeof row.dogovor_sigex_url === 'string' &&
    row.dogovor_sigex_url.length > 0

  async function prepareSigexSigning() {
    if (kind !== 'contract' || !pdfUrl || !idIsSafe(row.id)) {
      setSigexError('Не удалось определить договор или его PDF-файл.')
      setSigexPhase('error')
      return
    }

    setSigexPhase('preparing')
    setSigexError(null)
    setSigexLink(null)
    setSigexEvidenceUrl(null)

    try {
      const pdfResponse = await fetch(pdfUrl)
      if (!pdfResponse.ok) {
        throw new Error(`Не удалось загрузить PDF договора (HTTP ${pdfResponse.status}).`)
      }

      const pdf = await pdfResponse.blob()
      if ((await pdf.slice(0, 5).text()) !== '%PDF-') {
        throw new Error('Ссылка на договор не ведёт к PDF-файлу.')
      }

      const documentDescription = [
        config.title,
        documentNumber(row),
      ].filter(Boolean).join(' ')
      const signer = new QRSigningClientCMS(documentDescription, true)
      await signer.addDataToSign(
        [
          config.title,
          'Автокөлік құралын жалға алу шарты',
          'Vehicle rental agreement',
        ],
        pdf,
        documentNumber(row)
          ? [{ name: 'Номер договора', value: documentNumber(row) }]
          : [],
        true,
      )
      await signer.registerQRSinging()

      const mobileLink = signer.getEGovMobileLaunchLink()
      if (!isSigexMobileLink(mobileLink)) {
        throw new Error('SIGEX не вернул ссылку для запуска eGov Mobile.')
      }

      signerRef.current = signer
      setSigexLink(mobileLink)
      setSigexPhase('ready')
    } catch (signingError) {
      setSigexError(
        signingError instanceof Error
          ? signingError.message
          : 'Не удалось подготовить подписание через SIGEX.',
      )
      setSigexPhase('error')
    }
  }

  function launchSigexSigning() {
    const signer = signerRef.current
    if (!signer || signatureRequestRef.current) return

    setSigexPhase('waiting')
    setSigexError(null)
    const signatureRequest = signer.getSignatures()
    signatureRequestRef.current = signatureRequest

    void signatureRequest
      .then(async (signatures) => {
        if (signatures.length !== 1 || !signatures[0]) {
          throw new Error('SIGEX не вернул подпись договора.')
        }

        setSigexPhase('saving')
        const client = supabase
        if (!client) {
          throw new Error(supabaseConfigError ?? 'Supabase не настроен.')
        }

        const binarySignature = atob(signatures[0])
        const signatureBytes = Uint8Array.from(binarySignature, (character) =>
          character.charCodeAt(0),
        )
        const signatureFile = new Blob([signatureBytes], {
          type: 'application/pkcs7-mime',
        })
        const storagePath =
          `sigex/${encodeURIComponent(String(row.id))}/${crypto.randomUUID()}.p7m`
        const { error: uploadError } = await client.storage
          .from('contracts')
          .upload(storagePath, signatureFile, {
            contentType: 'application/pkcs7-mime',
            upsert: false,
          })
        if (uploadError) {
          throw new Error(`Подпись получена, но не удалось сохранить файл: ${uploadError.message}`)
        }

        const evidenceUrl = client.storage
          .from('contracts')
          .getPublicUrl(storagePath).data.publicUrl
        setSigexEvidenceUrl(evidenceUrl)

        const { data, error: updateError } = await client
          .from('contracts')
          .update({
            dogovor_sigex_url: evidenceUrl,
            dogovor_podpisan: new Date().toISOString(),
          })
          .eq('id', String(row.id))
          .select('id')
          .maybeSingle()
        if (updateError) {
          throw new Error(
            `Файл подписи сохранён, но CRM не записала результат: ${updateError.message}`,
          )
        }
        if (!data) {
          throw new Error(
            'Файл подписи сохранён, но CRM не подтвердила запись результата.',
          )
        }

        onSigexSigned(evidenceUrl)
      })
      .catch((signingError: unknown) => {
        setSigexError(
          signingError instanceof Error
            ? signingError.message
            : 'Не удалось получить или сохранить подпись SIGEX.',
        )
        setSigexPhase('error')
        signerRef.current = null
        signatureRequestRef.current = null
      })
  }

  return (
    <main className="shell">
      <header className="brand">
        <img className="brand-logo" src="/brand-logo.jpeg" alt="R-CORE" />
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

        {signed && (kind !== 'contract' || sigexSigned) ? (
          <div className="success-message" role="status">
            {sigexSigned ? 'Договор подписан через SIGEX' : config.signedLabel}
          </div>
        ) : isPreview ? (
          <form
            className="sign-form"
            onSubmit={(event) => event.preventDefault()}
          >
            <p className="code-hint">
              Код для демонстрации: <strong>1234</strong>
            </p>
            <p className="consent-text">
              Введите код, чтобы подтвердить согласие с условиями документа.
            </p>
            <label htmlFor="sign-code">Код подписи</label>
            <input id="sign-code" inputMode="numeric" autoComplete="one-time-code" />
            <button type="submit" disabled>
              Подписать документ
            </button>
            <p className="notice-text">
              Деморежим: подписание не изменяет данные.
            </p>
          </form>
        ) : kind === 'contract' ? (
          <div className="sign-form sigex-signing">
            <p className="code-hint">
              Подпишите договор электронной подписью через eGov Mobile.
            </p>
            {sigexPhase === 'idle' || sigexPhase === 'error' ? (
              <button
                type="button"
                onClick={() => void prepareSigexSigning()}
                disabled={!pdfUrl}
              >
                Подготовить подпись SIGEX
              </button>
            ) : null}
            {sigexPhase === 'preparing' && (
              <p className="notice-text" role="status">
                Готовим договор для SIGEX…
              </p>
            )}
            {sigexPhase === 'ready' && sigexLink && (
              <>
                <a
                  className="sigex-mobile-link"
                  href={sigexLink}
                  onClick={launchSigexSigning}
                >
                  Перейти в eGov Mobile и подписать
                </a>
                <p className="notice-text">
                  После подписания вернитесь на эту страницу. Результат и файл
                  подписи сохранятся автоматически.
                </p>
              </>
            )}
            {(sigexPhase === 'waiting' || sigexPhase === 'saving') && (
              <p className="notice-text" role="status">
                {sigexPhase === 'waiting'
                  ? 'Ожидаем результат eGov Mobile. Завершите подписание и вернитесь сюда.'
                  : 'Подпись получена. Сохраняем её в CRM…'}
              </p>
            )}
            {sigexError && (
              <p className="error-message" role="alert">{sigexError}</p>
            )}
            {sigexEvidenceUrl && sigexPhase === 'error' && (
              <p className="notice-text">
                Файл подписи сохранён:{' '}
                <a href={sigexEvidenceUrl}>скачать CMS с договором</a>
              </p>
            )}
          </div>
        ) : (
          <div className="pending-signing" role="status">
            <strong>Подписание пока недоступно</strong>
            <p>
              Подключение подтверждения подписи и генерации итогового PDF еще не
              перенесено.
            </p>
          </div>
        )}
        {error && <p className="error-message" role="alert">{error}</p>}
      </section>
      <footer>Документы предоставлены компанией R-CORE</footer>
    </main>
  )
}

function idIsSafe(value: unknown): value is string {
  return typeof value === 'string' && value.length > 0
}

function isSigexMobileLink(value: string | null): value is string {
  if (!value) return false
  try {
    const protocol = new URL(value).protocol
    return protocol === 'https:' || protocol === 'egovmobile:'
  } catch {
    return false
  }
}

function DocumentList({
  id,
  previewRow,
}: {
  id: string | null
  previewRow?: DataRow
}) {
  const [row, setRow] = useState<DataRow | null>(previewRow ?? null)
  const [message, setMessage] = useState('Загружаем список документов…')

  useEffect(() => {
    if (previewRow) {
      setRow(previewRow)
      setMessage('')
      return
    }
    if (!id || !supabase) {
      setMessage('Ссылка не содержит идентификатор договора.')
      return
    }
    let active = true
    void Promise.resolve(
      supabase.from('contracts')      .select(selectFields.contract).eq('id', id).maybeSingle(),
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
        if (!isDataRow(data)) {
          setMessage('Данные договора имеют неверный формат.')
          return
        }
        setRow(data)
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
  }, [id, previewRow])

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
        <Link
          className="secondary-link"
          to={`/dopSoglashenie?id=${encodeURIComponent(id!)}${id === 'preview' ? '&preview=1' : ''}`}
        >
          Дополнительные соглашения
        </Link>
      </section>
      <footer>Документы предоставлены компанией R-CORE</footer>
    </main>
  )
}

function AdditionalOverview({
  id,
  previewRow,
}: {
  id: string | null
  previewRow?: DataRow
}) {
  const [row, setRow] = useState<DataRow | null>(previewRow ?? null)
  const [message, setMessage] = useState('Загружаем дополнительное соглашение…')

  useEffect(() => {
    if (previewRow) {
      setRow(previewRow)
      setMessage('')
      return
    }
    if (!id || !supabase) {
      setMessage('Ссылка не содержит идентификатор соглашения.')
      return
    }
    let active = true
    void Promise.resolve(
      supabase
        .from('dop_soglachenie')
        .select(selectFields.additional)
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
        if (!isDataRow(data)) {
          setMessage('Данные соглашения имеют неверный формат.')
          return
        }
        setRow(data)
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
  }, [id, previewRow])

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

function AdditionalList({
  id,
  previewRows,
}: {
  id: string | null
  previewRows?: DataRow[]
}) {
  const [rows, setRows] = useState<DataRow[]>(previewRows ?? [])
  const [message, setMessage] = useState('Загружаем дополнительные соглашения…')

  useEffect(() => {
    if (previewRows) {
      setRows(previewRows)
      setMessage('')
      return
    }
    if (!id || !supabase) {
      setMessage('Ссылка не содержит идентификатор договора.')
      return
    }
    let active = true
    void Promise.resolve(
      supabase
        .from('dop_soglachenie')
        .select(
          'id,id_dogovora,created_at,date_dogovora,nomer_dogovora,nomer_dop_soglasheniya,url_dop_soglasheniya,status_podpisi_clienta',
        )
        .eq('id_dogovora', id),
    )
      .then(({ data, error }) => {
        if (!active) return
        if (error) {
          setMessage(error.message)
          return
        }
        const validRows = (data ?? []).filter(isDataRow)
        setRows(validRows)
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
  }, [id, previewRows])

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
          <Link
            className="document-link"
            to={`/subarenda?id=${encodeURIComponent(id)}${id === 'preview' ? '&preview=1' : ''}`}
          >
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
  const search = new URLSearchParams({ id })
  if (id.startsWith('preview')) search.set('preview', '1')
  return (
    <Link
      className="document-link"
      to={`${documentRoutes[kind]}?${search.toString()}`}
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
      <img className="brand-logo" src="/brand-logo.jpeg" alt="R-CORE" />
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
