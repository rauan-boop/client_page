// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> soglasieNaShtraf(
  String nomerDogovora,
  DateTime dateDogovora,
  String logoUrl,
  String? signCode,
  String compName,
  String compIIN,
  String compDirectorSurname,
  String compDirectorName,
  String? compDirectorFather,
  String clientFio,
  String clientIIN,
  String carMarka,
  String carModel,
  String carPlate,
  String clientPhone,
  DateTime startDate,
  DateTime endDate,
  bool raspechatat, // Передан булевой флаг для ручной печати
  bool status, // Статус подписи (true - подписан ПЭП / false - проект)
) async {
  try {
    final supabase = Supabase.instance.client;
    final DateFormat df = DateFormat('dd.MM.yyyy', 'ru');
    final DateFormat dtf = DateFormat('dd.MM.yyyy HH:mm', 'ru');
    final DateFormat dfLong = DateFormat('«d» MMMM yyyy', 'ru');

    final logoResponse = await http.get(Uri.parse(logoUrl));
    if (logoResponse.statusCode != 200) throw Exception('Failed to load logo');
    final logoImage = pw.MemoryImage(logoResponse.bodyBytes);

    final font = await PdfGoogleFonts.montserratRegular();
    final boldFont = await PdfGoogleFonts.montserratBold();

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(2.0 * PdfPageFormat.cm),
        build: (context) {
          return pw.Stack(
            children: [
              pw.Center(
                child: pw.Opacity(
                  opacity: 0.1,
                  child: pw.Image(logoImage, height: 400),
                ),
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Align(
                    alignment: pw.Alignment.topRight,
                    child: pw.Text(
                      'Приложение № 2 к Договору № $nomerDogovora\nот ${dfLong.format(dateDogovora)} г.',
                      style: pw.TextStyle(font: font, fontSize: 8),
                      textAlign: pw.TextAlign.right,
                    ),
                  ),
                  pw.SizedBox(height: 30),
                  pw.Center(
                    child: pw.Text(
                      "Соглашение на перевод административных правонарушений",
                      style: pw.TextStyle(font: boldFont, fontSize: 12),
                      textAlign: pw.TextAlign.center,
                    ),
                  ),
                  pw.SizedBox(height: 30),

                  buildParagraph(font,
                      "Я, $clientFio, ИИН $clientIIN, предоставляю свое безусловное согласие на перенос на мое имя административных и других штрафов, полученных при владении автомобиля $carMarka $carModel, рег. номер $carPlate принадлежащего ИП «$compName», в лице $compDirectorSurname $compDirectorName ${compDirectorFather ?? ""}, ИИН $compIIN, в период аренды с ${dtf.format(startDate)} г. до ${dtf.format(endDate)} г. на основании договора аренды №$nomerDogovora от ${df.format(dateDogovora)} г."),

                  pw.SizedBox(height: 10),

                  buildParagraph(font,
                      "Так же, соглашаюсь с продлением сроков данного Соглашения в случае продления мною вышеуказанного договора (на срок, указанный в дополнительном соглашении)."),

                  pw.SizedBox(height: 30),

                  // БЛОК РУЧНОЙ ПОДПИСИ
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        width: 250,
                        decoration: const pw.BoxDecoration(
                            border: pw.Border(bottom: pw.BorderSide(width: 1))),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                          raspechatat || !status
                              ? '(подпись Арендатора / дата)'
                              : '(подпись)',
                          style: pw.TextStyle(font: font, fontSize: 6)),
                      pw.SizedBox(height: 12),
                      pw.Text('ФИО: $clientFio',
                          style: pw.TextStyle(font: font, fontSize: 8)),
                      pw.Text('ИИН: $clientIIN',
                          style: pw.TextStyle(font: font, fontSize: 8)),
                    ],
                  ),

                  if (!raspechatat && status) pw.Spacer(),

                  // БЛОК ПЭП (ШТАМП) — Отображается ТОЛЬКО при status == true и !raspechatat
                  if (!raspechatat &&
                      status &&
                      signCode != null &&
                      signCode!.isNotEmpty)
                    pw.Container(
                      width: double.infinity,
                      padding: const pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                        border:
                            pw.Border.all(color: PdfColors.blue900, width: 1.5),
                        borderRadius:
                            const pw.BorderRadius.all(pw.Radius.circular(4)),
                      ),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                              'ДОКУМЕНТ ПОДПИСАН С ИСПОЛЬЗОВАНИЕМ ПРОСТОЙ ЭЛЕКТРОННОЙ ПОДПИСИ',
                              style: pw.TextStyle(
                                  font: boldFont,
                                  fontSize: 8,
                                  color: PdfColors.blue900)),
                          pw.SizedBox(height: 8),
                          pw.Text('Подписант: $clientFio',
                              style: pw.TextStyle(font: font, fontSize: 8)),
                          pw.Text('ИИН: $clientIIN',
                              style: pw.TextStyle(font: font, fontSize: 8)),
                          pw.SizedBox(height: 4),
                          pw.RichText(
                            text: pw.TextSpan(
                              children: [
                                pw.TextSpan(
                                    text: 'Статус: ',
                                    style:
                                        pw.TextStyle(font: font, fontSize: 8)),
                                pw.TextSpan(
                                    text:
                                        'ПОДПИСАНО ПЭП (Простой электронной подписью)',
                                    style: pw.TextStyle(
                                        font: boldFont,
                                        fontSize: 8,
                                        color: PdfColors.green800)),
                              ],
                            ),
                          ),
                          pw.Text(
                              'Подпись подтверждена SMS-кодом отправленным на WhatsApp ($clientPhone)',
                              style: pw.TextStyle(font: font, fontSize: 7)),
                          pw.Text(
                              'Код: $signCode. Время: ${dtf.format(DateTime.now())}',
                              style: pw.TextStyle(font: boldFont, fontSize: 8)),
                          pw.SizedBox(height: 6),
                          pw.Divider(thickness: 0.5, color: PdfColors.grey400),
                          pw.Text(
                            'Согласно ст. 7 Закона РК «Об электронном документе и электронной цифровой подписи», данный документ в электронной форме признается равнозначным документу на бумажном носителе.',
                            style: pw.TextStyle(
                                font: font,
                                fontSize: 6,
                                color: PdfColors.grey700),
                          ),
                        ],
                      ),
                    ),

                  pw.SizedBox(height: 10),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        raspechatat || !status
                            ? 'Сформировано в ИС CRM "R-CORE"'
                            : 'Визуализация электронного документа. Сформировано в ИС CRM "R-CORE". ${dtf.format(DateTime.now())}',
                        style: pw.TextStyle(
                            font: font, fontSize: 7, color: PdfColors.grey),
                      ),
                      pw.Text(
                        'Стр. ${context.pageNumber} из ${context.pagesCount}',
                        style: pw.TextStyle(
                            font: boldFont,
                            fontSize: 7,
                            color: PdfColors.grey800),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    final Uint8List pdfBytes = await pdf.save();
    final String fileName =
        'soglasie_na_shtraf_${nomerDogovora}_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final String fullPath = 'soglasie/$fileName';

    await supabase.storage.from('contracts').uploadBinary(fullPath, pdfBytes,
        fileOptions:
            const FileOptions(upsert: true, contentType: 'application/pdf'));

    return supabase.storage.from('contracts').getPublicUrl(fullPath);
  } catch (e) {
    print('Error: $e');
    return null;
  }
}

pw.Widget buildParagraph(pw.Font family, String text) {
  return pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 8),
    child: pw.Text(
      "       $text",
      style: pw.TextStyle(font: family, fontSize: 10),
      textAlign: pw.TextAlign.justify,
    ),
  );
}
