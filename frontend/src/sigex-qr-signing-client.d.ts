declare module 'sigex-qr-signing-client' {
  export class QRSigningClientCMS {
    constructor(description: string, attach?: boolean, baseUrl?: string)
    addDataToSign(
      names: string[],
      data: string | ArrayBuffer | Blob | File,
      meta?: Array<{ name: string; value: string }>,
      isPDF?: boolean,
    ): Promise<void>
    registerQRSinging(): Promise<string>
    getEGovMobileLaunchLink(): string | null
    getSignatures(): Promise<string[]>
  }
}
