// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> mergeTechnicalPage(
  String existingPdfUrl,
  String docTitleWithNumber,
  String contractId,
  String clientIP,
  String clientDeviceInfo,
  String? signCode,
  String compName,
  String compIIN,
  String compAddress,
  String compPhone,
  String compIIK,
  String compBIK,
  String compKBE,
  String compDirDocs,
  DateTime compDirDocsDate,
  String compDirDocsVydan,
  String compDirectorSurname,
  String compDirectorName,
  String? compDirectorFather,
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
  String? clientMail,
) async {
  try {
    final supabase = Supabase.instance.client;
    final dtf = DateFormat('dd.MM.yyyy HH:mm', 'ru');
    final df = DateFormat('dd.MM.yyyy', 'ru');
    final currentTime = DateTime.now();

    // 1. ПОЛУЧАЕМ КОНТРОЛЬНУЮ СУММУ (SHA-256) ОРИГИНАЛА
    final response = await http.get(Uri.parse(existingPdfUrl));
    if (response.statusCode != 200)
      throw Exception('Ошибка загрузки оригинала');
    final String mainHash = sha256.convert(response.bodyBytes).toString();

    // 2. ПОДГОТОВКА СТРУКТУРЫ PDF
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.montserratRegular();
    final boldFont = await PdfGoogleFonts.montserratBold();

    // Загрузка логотипа для водяного знака
    final logoResponse = await http.get(Uri.parse(
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ronat-admin-ecwuw2/assets/veghoejwnra4/логотип_копия.png'));
    final pw.MemoryImage logoImage = pw.MemoryImage(logoResponse.bodyBytes);

    // Путь к файлу
    final String path =
        'tech_passports/passport_${contractId}_${currentTime.millisecondsSinceEpoch}.pdf';
    final String publicUrl =
        supabase.storage.from('contracts').getPublicUrl(path);

    pdf.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(1.5 * PdfPageFormat.cm),
          buildBackground: (context) {
            return pw.FullPage(
              ignoreMargins: true,
              child: pw.Center(
                child: pw.Opacity(
                  opacity: 0.07,
                  child: pw.Image(logoImage, width: 400),
                ),
              ),
            );
          },
        ),
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Center(
                child: pw.Text('ТЕХНИЧЕСКИЙ ПАСПОРТ ИДЕНТИФИКАЦИИ',
                    style: pw.TextStyle(font: boldFont, fontSize: 14))),
            pw.SizedBox(height: 20),

            // ИНФОРМАЦИОННЫЙ БЛОК
            pw.Container(
              padding: const pw.EdgeInsets.all(8),
              decoration: const pw.BoxDecoration(color: PdfColors.grey200),
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('ПОДТВЕРЖДАЕМЫЙ ДОКУМЕНТ: $docTitleWithNumber',
                        style: pw.TextStyle(font: boldFont, fontSize: 9)),
                    pw.Text('ID ТРАНЗАКЦИИ В CRM R-CORE: $contractId',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text('КОНТРОЛЬНАЯ СУММА (SHA-256): $mainHash',
                        style: pw.TextStyle(
                            font: font, fontSize: 7, color: PdfColors.blue900)),
                  ]),
            ),
            pw.SizedBox(height: 20),

            // РЕКВИЗИТЫ СТОРОН
            pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              // АРЕНДОДАТЕЛЬ
              pw.Expanded(
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                    pw.Text('АРЕНДОДАТЕЛЬ:',
                        style: pw.TextStyle(font: boldFont, fontSize: 9)),
                    pw.Divider(thickness: 0.5),
                    pw.Text('ИП "$compName"',
                        style: pw.TextStyle(font: boldFont, fontSize: 8)),
                    pw.Text('ИИН/БИН: $compIIN',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text('Адрес: $compAddress',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text(
                        'Уд. лич.: №$compDirDocs от ${df.format(compDirDocsDate)} $compDirDocsVydan',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text(
                        'ИИК: ${compIIK.isNotEmpty ? compIIK : "---"} | БИК: ${compBIK.isNotEmpty ? compBIK : "---"}',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text('Тел: $compPhone',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text(
                        'Руководитель: $compDirectorSurname ${compDirectorName[0]}.${compDirectorFather != null && compDirectorFather.isNotEmpty ? compDirectorFather[0] + "." : ""}',
                        style: pw.TextStyle(font: boldFont, fontSize: 8)),
                  ])),
              pw.SizedBox(width: 20),
              // АРЕНДАТОР
              pw.Expanded(
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                    pw.Text('АРЕНДАТОР:',
                        style: pw.TextStyle(font: boldFont, fontSize: 9)),
                    pw.Divider(thickness: 0.5),
                    pw.Text('$clientSurname $clientName ${clientFather ?? ""}',
                        style: pw.TextStyle(font: boldFont, fontSize: 8)),
                    pw.Text('ИИН: ${clientIIN ?? "---"}',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text(
                        'Уд. лич.: №$clientDocNum ${clientDocDate != null ? "от " + df.format(clientDocDate!) : ""} $clientDocBy',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text('Регистрация: $clientAddressReg',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text('Тел: $clientPhone',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text('КОД ПОДТВЕРЖДЕНИЯ (SMS): ${signCode ?? "****"}',
                        style: pw.TextStyle(
                            font: boldFont,
                            fontSize: 8,
                            color: PdfColors.green800)),
                  ])),
            ]),
            pw.SizedBox(height: 30),

            // ЦИФРОВОЙ СЛЕД
            pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              pw.Expanded(
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                    pw.Text('МЕТОД ПОДПИСИ (АРЕНДОДАТЕЛЬ):',
                        style: pw.TextStyle(font: boldFont, fontSize: 8)),
                    pw.Text(
                        'Документ, сформированный в информационной системе CRM "R-CORE", является подписанным со стороны компании',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text('Дата и время фиксации: ${dtf.format(currentTime)}',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                  ])),
              pw.SizedBox(width: 20),
              pw.Expanded(
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                    pw.Text('МЕТОД ПОДПИСИ (АРЕНДАТОР):',
                        style: pw.TextStyle(font: boldFont, fontSize: 8)),
                    pw.Text('IP-адрес: $clientIP',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text('Устройство: $clientDeviceInfo',
                        style: pw.TextStyle(
                            font: font,
                            fontSize: clientDeviceInfo.length > 50 ? 6.5 : 8)),
                    pw.Text('Время ввода кода: ${dtf.format(currentTime)}',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                  ])),
            ]),
            pw.SizedBox(height: 10),

            // ЮРИДИЧЕСКОЕ ОСНОВАНИЕ И ТЕКСТ ПРОВЕРКИ
            pw.Container(
              width: double.infinity,
              padding:
                  const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: const pw.BoxDecoration(
                border: pw.Border(
                    top: pw.BorderSide(width: 0.5, color: PdfColors.grey400)),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Настоящий документ подтвержден простой электронной подписью в соответствии со ст. 20-1 Закона РК «Об информатизации» № 418-V (в ред. от 21.05.2024 № 86-VIII). Стороны согласны использовать простую электронную подпись и признают юридическую силу данного метода подтверждения.',
                    style: pw.TextStyle(
                        font: font, fontSize: 7, color: PdfColors.grey800),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    'Настоящий документ в соответствии с п. 1 ст. 7 Закона РК от 7 января 2003 года № 370-II «Об электронном документе и электронной цифровой подписи» равнозначен документу на бумажном носителе. Подписанный документ представляет собой электронный файл в формате PDF, состоящий из визуально отображаемой печатной формы и зафиксированного в системе цифрового следа. Визуальная часть носит информационный характер.',
                    style: pw.TextStyle(
                        font: font, fontSize: 6.5, color: PdfColors.grey800),
                  ),
                  pw.SizedBox(height: 3),
                  pw.Text(
                    'Для проверки аутентичности, целостности и юридической силы документа отсканируйте QR-код с помощью камеры смартфона или сканера. Вы будете перенаправлены в модуль проверки системы R-CORE, где сможете сверить оригинальный файл и подтвердить статус подписи по контрольной сумме (SHA-256).',
                    style: pw.TextStyle(
                        font: font, fontSize: 6.5, color: PdfColors.grey800),
                  ),
                ],
              ),
            ),
            pw.Spacer(),

            // QR КОД И ПОДПИСЬ
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Документ сформирован системой R-CORE ',
                            style: pw.TextStyle(
                                font: font,
                                fontSize: 7,
                                color: PdfColors.grey700)),
                        pw.Text(
                            'Оригинал документа доступен по QR-коду справа.',
                            style: pw.TextStyle(
                                font: font,
                                fontSize: 7,
                                color: PdfColors.grey700)),
                      ]),
                  // ГЕНЕРАЦИЯ QR-КОДА С ЛОГОТИПОМ
                  pw.Stack(
                    alignment: pw.Alignment.center,
                    children: [
                      pw.BarcodeWidget(
                          barcode: pw.Barcode.qrCode(),
                          data: existingPdfUrl,
                          width: 120,
                          height: 120),
                      pw.Container(
                        width: 25,
                        height: 25,
                        decoration: const pw.BoxDecoration(
                            color: PdfColors.white, shape: pw.BoxShape.circle),
                      ),
                      pw.Container(
                        width: 20,
                        height: 20,
                        child: pw.Image(logoImage),
                      ),
                    ],
                  ),
                ]),
          ],
        ),
      ),
    );

    final Uint8List pdfBytes = await pdf.save();
    await supabase.storage.from('contracts').uploadBinary(path, pdfBytes,
        fileOptions:
            const FileOptions(upsert: true, contentType: 'application/pdf'));

    return publicUrl;
  } catch (e) {
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
