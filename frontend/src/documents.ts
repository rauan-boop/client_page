export type DocumentKind =
  | 'contract'
  | 'act'
  | 'consent'
  | 'additional'
  | 'sublease'

export type DocumentConfig = {
  kind: DocumentKind
  table: 'contracts' | 'dop_soglachenie' | 'dogovor_subarendy'
  title: string
  codeField: string
  signedField: string
  pdfField: string
  viewedField?: string
  signedLabel: string
}

export const documents: Record<DocumentKind, DocumentConfig> = {
  contract: {
    kind: 'contract',
    table: 'contracts',
    title: 'Договор аренды автотранспортного средства',
    codeField: 'dogovor_code',
    signedField: 'dogovor_podpisan',
    pdfField: 'dogovor_url',
    viewedField: 'viewed_dogovor',
    signedLabel: 'Договор подписан',
  },
  act: {
    kind: 'act',
    table: 'contracts',
    title: 'Акт приема-передачи автотранспортного средства',
    codeField: 'act_priema_code',
    signedField: 'act_podpisan',
    pdfField: 'act_priema_url',
    viewedField: 'viewed_act',
    signedLabel: 'Акт подписан',
  },
  consent: {
    kind: 'consent',
    table: 'contracts',
    title: 'Согласие на перевод полученных штрафов',
    codeField: 'soglasie_na_shtraf_code',
    signedField: 'soglasie_podpisano',
    pdfField: 'soglasie_na_straf_url',
    viewedField: 'viewed_soglasie',
    signedLabel: 'Согласие подписано',
  },
  additional: {
    kind: 'additional',
    table: 'dop_soglachenie',
    title: 'Дополнительное соглашение к договору',
    codeField: 'cod_podpisi',
    signedField: 'status_podpisi_clienta',
    pdfField: 'url_dop_soglasheniya',
    signedLabel: 'Документ подписан',
  },
  sublease: {
    kind: 'sublease',
    table: 'dogovor_subarendy',
    title: 'Договор субаренды',
    codeField: 'dogovor_subarendy_cod',
    signedField: 'created_at',
    pdfField: 'dogovor_subarendy_url',
    viewedField: 'viewed_dogovor',
    signedLabel: 'Договор подписан',
  },
}

export const documentRoutes: Record<DocumentKind, string> = {
  contract: '/contract',
  act: '/act',
  consent: '/soglasie',
  additional: '/dopSoglasheniePage',
  sublease: '/subarenda',
}

export function resolveDocumentKind(pathname: string): DocumentKind | null {
  switch (pathname.toLowerCase()) {
    case '/contract':
      return 'contract'
    case '/act':
      return 'act'
    case '/soglasie':
      return 'consent'
    case '/dopsoglasheniepage':
      return 'additional'
    case '/subarenda':
      return 'sublease'
    default:
      return null
  }
}

export function formatDate(value: unknown): string {
  if (typeof value !== 'string' && !(value instanceof Date)) return ''
  const date = new Date(value)
  return Number.isNaN(date.getTime())
    ? ''
    : new Intl.DateTimeFormat('ru-RU', { dateStyle: 'long' }).format(date)
}

export function documentNumber(row: Record<string, unknown>): string {
  const value = row.nomer_dogovora ?? row.nomer_dop_soglasheniya
  return typeof value === 'string' && value.length > 0 ? `№ ${value}` : ''
}
