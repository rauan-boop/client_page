// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase/supabase.dart';

Future<String?> generateContractLocal(
  String agreementText,
  String fileName,
  String nomerDogovora,
  DateTime dateDogovora,
  String polzovatelCity,
  String logoUrl,
  String? signCode,
  String compName,
  String compIIN,
  String compAddress,
  String compPhone,
  String compDirectorSurname,
  String compDirectorName,
  String? compDirectorFather,
  String compRegNumber,
  DateTime? compRegDate,
  String compBankName,
  String compIIK,
  String compBIK,
  String clientSurname,
  String clientName,
  String? clientFather,
  String? clientIIN,
  String clientDocNum,
  DateTime? clientDocDate,
  String clientDocBy,
  String clientPhone,
  String clientAddressReg,
  String? clientAddressLive,
  String? vyhodnoi,
  String? depozitCardoo,
  DateTime startDate,
  DateTime endDate,
  int totalCost,
  int dayCost,
  int? depozit,
  String carValue,
  String compKBE,
  String compDirDocs,
  DateTime compDirDocsDate,
  String compDirDocsVydan,
  String clientDocsVydan,
  String clientMail,
  int? vyezd,
  int? cardoo,
  bool raspechatat,
  String stampUrl, // Ссылка на PNG печать
  String punkt31, // Новый кирпичик текста для пункта 3.1
  String punkt36, // Новый кирпичик текста для пункта 3.6
  bool status, // Статус подписи (true - подписан / false - проект)
) async {
  try {
    final supabase = Supabase.instance.client;

    final DateFormat df = DateFormat('dd MMMM yyyy', 'ru');
    final DateFormat dtf = DateFormat('HH:mm dd MMMM yyyy', 'ru');
    final NumberFormat nf = NumberFormat.currency(
      locale: 'ru_RU',
      symbol: 'тг',
      decimalDigits: 0,
    );

    final logoResponse = await http.get(Uri.parse(logoUrl));
    if (logoResponse.statusCode != 200) throw Exception('Failed to load logo');
    final logoImage = pw.MemoryImage(logoResponse.bodyBytes);

    final stampResponse = await http.get(Uri.parse(stampUrl));
    if (stampResponse.statusCode != 200)
      throw Exception('Failed to load stamp');
    final stampImage = pw.MemoryImage(stampResponse.bodyBytes);

    final font = await PdfGoogleFonts.montserratRegular();
    final boldFont = await PdfGoogleFonts.montserratBold();

    // 1. Сначала меняем пункты 3.1 и 3.6 в исходном тексте
    String baseContent = agreementText
        .replaceAll('[punkt_3.1]', punkt31)
        .replaceAll('[punkt_3.6]', punkt36);

    // 2. ИСПРАВЛЕНО: Теперь цепочка остальных замен идет из baseContent, а не из сырого текста!
    String content = baseContent
        .replaceAll('[NOMER]', nomerDogovora)
        .replaceAll('[DATE_DOGOVORA]', df.format(dateDogovora))
        .replaceAll('[CITY]', polzovatelCity)
        .replaceAll('[SIGN_CODE]', signCode ?? 'Подписано через WhatsApp')
        .replaceAll('[COMP_NAME]', compName)
        .replaceAll('[COMP_IIN]', compIIN)
        .replaceAll('[COMP_ADDRESS]', compAddress)
        .replaceAll('[COMP_PHONE]', compPhone)
        .replaceAll('[COMP_DIRECTOR]',
            '$compDirectorSurname $compDirectorName ${compDirectorFather ?? ""}')
        .replaceAll('[COMP_IIK]', compIIK)
        .replaceAll('[COMP_BIK]', compBIK)
        .replaceAll('[COMP_KBE]', compKBE)
        .replaceAll('[COMP_REG_NUM]', compRegNumber)
        .replaceAll('[COMP_REG_DATE]',
            compRegDate != null ? df.format(compRegDate!) : '')
        .replaceAll('[COMP_DIR_DOCS]', compDirDocs)
        .replaceAll('[COMP_DIR_DOCS_DATE]', df.format(compDirDocsDate))
        .replaceAll('[COMP_DIR_DOCS_VYDAN]', compDirDocsVydan)
        .replaceAll(
            '[CLIENT_FIO]', '$clientSurname $clientName ${clientFather ?? ""}')
        .replaceAll('[CLIENT_IIN]', clientIIN ?? "")
        .replaceAll('[CLIENT_DOC_NUM]', clientDocNum)
        .replaceAll('[CLIENT_DOC_DATE]',
            clientDocDate != null ? df.format(clientDocDate!) : '')
        .replaceAll('[CLIENT_DOC_BY]', clientDocBy)
        .replaceAll('[CLIENT_PHONE]', clientPhone)
        .replaceAll('[CLIENT_DOCS_VYDAN]', clientDocsVydan)
        .replaceAll('[CLIENT_MAIL]', clientMail)
        .replaceAll('[CLIENT_ADDR_REG]', clientAddressReg)
        .replaceAll('[CLIENT_ADDR_LIVE]', clientAddressLive ?? clientAddressReg)
        .replaceAll('[VYHODNOI]', vyhodnoi ?? '')
        .replaceAll('[DEPOZIT_CARDOO]', depozitCardoo ?? '')
        .replaceAll('[START_DATE]', dtf.format(startDate))
        .replaceAll('[END_DATE]', dtf.format(endDate))
        .replaceAll('[DAY_COST]', nf.format(dayCost))
        .replaceAll('[TOTAL_COST]', nf.format(totalCost))
        .replaceAll('[DEPOZIT]', nf.format(depozit ?? 0))
        .replaceAll('[CAR_VYEZD]', nf.format(vyezd ?? 0))
        .replaceAll('[CARDOO]', nf.format(cardoo ?? 0))
        .replaceAll('[CAR_VALUE]', carValue)
        .replaceAll('[RASPECHATAT]', raspechatat == true ? 'Да' : 'Нет');

    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageTheme: pw.PageTheme(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(1.5 * PdfPageFormat.cm),
          buildBackground: (context) => pw.Center(
            child: pw.Opacity(
                opacity: 0.15, child: pw.Image(logoImage, height: 400)),
          ),
        ),
        header: (context) {
          if (context.pageNumber == 1) {
            return pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 20),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Image(logoImage, height: 40),
                  pw.Text('г. $polzovatelCity, ${df.format(dateDogovora)} г.',
                      style: pw.TextStyle(font: font, fontSize: 9)),
                ],
              ),
            );
          } else {
            return pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 10),
              child: pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text(
                    'Договор аренды № $nomerDogovora от ${df.format(dateDogovora)} г.',
                    style: pw.TextStyle(
                        font: font, fontSize: 7, color: PdfColors.grey700)),
              ),
            );
          }
        },
        footer: (context) => pw.Column(
          mainAxisSize: pw.MainAxisSize.min,
          children: [
            pw.Divider(thickness: 0.5, color: PdfColors.grey400),
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Text(
                'Визуализация electronic документа Сформировано в R-CORE CRM Дата/Время: ${dtf.format(DateTime.now())}',
                style: pw.TextStyle(
                    font: font, fontSize: 7, color: PdfColors.grey),
              ),
            ),
          ],
        ),
        build: (context) => [
          pw.SizedBox(height: 10),
          pw.Center(
            child: pw.Column(children: [
              pw.Text('ДОГОВОР',
                  style: pw.TextStyle(font: boldFont, fontSize: 14)),
              pw.Text(
                  'аренды автотранспортного средства без экипажа № $nomerDogovora',
                  style: pw.TextStyle(font: boldFont, fontSize: 12)),
            ]),
          ),
          pw.SizedBox(height: 10),
          pw.Paragraph(
            text: content,
            style: pw.TextStyle(font: font, fontSize: 9),
            textAlign: pw.TextAlign.justify,
          ),
          pw.SizedBox(height: 30),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Stack(
                      children: [
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('АРЕНДОДАТЕЛЬ:',
                                style:
                                    pw.TextStyle(font: boldFont, fontSize: 9)),
                            pw.Divider(thickness: 0.5),
                            pw.Text('ИП "$compName"',
                                style:
                                    pw.TextStyle(font: boldFont, fontSize: 8)),
                            pw.Text('ИИН/БИН: $compIIN',
                                style: pw.TextStyle(font: font, fontSize: 8)),
                            pw.Text('Адрес: $compAddress',
                                style: pw.TextStyle(font: font, fontSize: 8)),
                            pw.Text('Тел: $compPhone',
                                style: pw.TextStyle(font: font, fontSize: 8)),
                            pw.SizedBox(height: 4),
                            pw.Text(
                                'Руководитель: $compDirectorSurname ${compDirectorName[0]}.',
                                style:
                                    pw.TextStyle(font: boldFont, fontSize: 8)),
                          ],
                        ),
                        pw.Positioned(
                          right: 10,
                          top: 10,
                          child: pw.Opacity(
                            opacity: 0.75,
                            child: pw.Image(stampImage, width: 90, height: 90),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 20),
                  ],
                ),
              ),
              pw.SizedBox(width: 30),
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('АРЕНДАТОР:',
                        style: pw.TextStyle(font: boldFont, fontSize: 9)),
                    pw.Divider(thickness: 0.5),
                    pw.Text('$clientSurname $clientName ${clientFather ?? ""}',
                        style: pw.TextStyle(font: boldFont, fontSize: 8)),
                    pw.Text('ИИН: $clientIIN',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text(
                        'Уд. личности №$clientDocNum выдано $clientDocsVydan ${clientDocDate != null ? df.format(clientDocDate!) : ""}',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text('Адрес прописки: $clientAddressReg',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text(
                        'Адрес проживания: ${clientAddressLive ?? clientAddressReg}',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text('Тел: $clientPhone',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text('E-mail: ${clientMail ?? "-"}',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                  ],
                ),
              ),
            ],
          ),
          if (raspechatat == true)
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 15),
                    pw.Container(
                      width: 230,
                      decoration: const pw.BoxDecoration(
                          border: pw.Border(bottom: pw.BorderSide(width: 1))),
                    ),
                    pw.Text('(подпись / М.П.)',
                        style: pw.TextStyle(font: font, fontSize: 6)),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 15),
                    pw.Container(
                      width: 230,
                      decoration: const pw.BoxDecoration(
                          border: pw.Border(bottom: pw.BorderSide(width: 1))),
                    ),
                    pw.Text('(подпись)',
                        style: pw.TextStyle(font: font, fontSize: 6)),
                  ],
                ),
              ],
            ),
          if (raspechatat != true)
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 20),
              child: pw.Container(
                padding: const pw.EdgeInsets.all(12),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.blue900, width: 2),
                  borderRadius:
                      const pw.BorderRadius.all(pw.Radius.circular(5)),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Center(
                      child: pw.Text(
                        'ДОКУМЕНТ ПОДПИСАН С ИСПОЛЬЗОВАНИЕМ ПРОСТОЙ ЭЛЕКТРОННОЙ ПОДПИСИ (ПЭП)',
                        style: pw.TextStyle(
                            font: boldFont,
                            fontSize: 10,
                            color: PdfColors.blue900),
                      ),
                    ),
                    pw.SizedBox(height: 12),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        // АРЕНДОДАТЕЛЬ
                        pw.Expanded(
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('АРЕНДОДАТЕЛЬ:',
                                  style: pw.TextStyle(
                                      font: boldFont, fontSize: 8)),
                              pw.Text('ИП "$compName"',
                                  style: pw.TextStyle(font: font, fontSize: 8)),
                              pw.Text('БИН/ИИН: $compIIN',
                                  style: pw.TextStyle(font: font, fontSize: 8)),
                              pw.Text(
                                  'Документ сгенерированный системой CRM "R-CORE" является подписанным со стороны Арендодателя',
                                  style: pw.TextStyle(
                                      font: font,
                                      fontSize: 7,
                                      color: PdfColors.grey700)),
                              pw.SizedBox(height: 4),
                              pw.Text('СТАТУС: ПОДПИСАНО',
                                  style: pw.TextStyle(
                                      font: boldFont,
                                      fontSize: 8,
                                      color: PdfColors.green800)),
                            ],
                          ),
                        ),
                        pw.SizedBox(width: 20),
                        // АРЕНДАТОР
                        pw.Expanded(
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('АРЕНДАТОР:',
                                  style: pw.TextStyle(
                                      font: boldFont, fontSize: 8)),
                              pw.Text(
                                  '$clientSurname $clientName ${clientFather ?? ""}',
                                  style: pw.TextStyle(
                                      font: boldFont, fontSize: 8)),
                              pw.Text('ИИН: $clientIIN',
                                  style: pw.TextStyle(font: font, fontSize: 8)),
                              pw.SizedBox(height: 4),
                              pw.Text(
                                  'СТАТУС: ПОДПИСАНО ПЭП (Простой электронной подписью)',
                                  style: pw.TextStyle(
                                      font: boldFont,
                                      fontSize: 8,
                                      color: PdfColors.green800)),
                              pw.Text(
                                'Подпись подтверждена SMS-кодом отправленным на месенджер WhatsApp (номер телефона $clientPhone)',
                                style: pw.TextStyle(font: font, fontSize: 7),
                              ),
                              pw.Text(
                                'Код подтверждения: ${signCode ?? "verified"}',
                                style: pw.TextStyle(
                                    font: boldFont,
                                    fontSize: 8,
                                    color: PdfColors.green800),
                              ),
                              pw.Text(
                                'Дата и время подписи: ${dtf.format(DateTime.now())}',
                                style: pw.TextStyle(font: font, fontSize: 7),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 10),
                    pw.Divider(thickness: 0.5, color: PdfColors.blue900),
                    pw.Text(
                      'Согласно ст. 7 Закона РК «Об электронном документе и электронной цифровой подписи» и ст. 20-1 Закона РК «Об информатизации» № 418-V (в ред от 21.05.2024 № 86-VIII), данный документ в электронной форме признается равнозначным документу на бумажном носителе, подписанному собственноручной подписью.',
                      style: pw.TextStyle(
                          font: font, fontSize: 6, color: PdfColors.grey700),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );

    final Uint8List pdfBytes = await pdf.save();
    final String fullPath =
        'contracts/dogovor_${nomerDogovora}_${DateTime.now().millisecondsSinceEpoch}.pdf';
    await supabase.storage.from('contracts').uploadBinary(fullPath, pdfBytes,
        fileOptions:
            const FileOptions(upsert: true, contentType: 'application/pdf'));

    return supabase.storage.from('contracts').getPublicUrl(fullPath);
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
