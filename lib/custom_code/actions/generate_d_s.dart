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

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> generateDS(
  String nomerDS,
  String nomerDogovora,
  DateTime dateDogovora,
  String city,
  DateTime dateRegistracii,
  String nameCompany,
  String iinCompany,
  String familiyaHozyainaCompani,
  String imyaHozyainaCompani,
  String? otchestvoHozyainaCompani,
  String dataClienta,
  String iinClienta,
  DateTime dateNachala,
  DateTime dateOkonchaniya,
  double cenaArendy,
  double? cenaViezda,
  double obchayaStoimost,
  String adresRegistracii,
  String adresRegistraciiClienta,
  String adresprozhivaniyaClienta,
  String nomerDocumentaHozyainaCompani,
  String nomerudostovereniya,
  String dateVydachi,
  String cemVydano,
  DateTime dateVydachiClient,
  String cemVydanoClient,
  String nomerTelehona,
  String nomerTelehonaClient,
  String iikCompany,
  String bikCompany,
  String kbeCompany,
  String logoUrl,
  String stampUrl,
  bool status,
  String? smsCode,
) async {
  try {
    final supabase = Supabase.instance.client;
    final DateFormat dtf = DateFormat('dd.MM.yyyy HH:mm', 'ru');
    final DateFormat dfShort = DateFormat('dd.MM.yyyy', 'ru');
    final String currentTime =
        DateFormat('dd.MM.yyyy HH:mm', 'ru').format(DateTime.now());

    final logoResponse = await http.get(Uri.parse(logoUrl));
    final logoImage = logoResponse.statusCode == 200
        ? pw.MemoryImage(logoResponse.bodyBytes)
        : null;

    final stampResponse = await http.get(Uri.parse(stampUrl));
    final stampImage = stampResponse.statusCode == 200
        ? pw.MemoryImage(stampResponse.bodyBytes)
        : null;

    final font = await PdfGoogleFonts.robotoRegular();
    final boldFont = await PdfGoogleFonts.robotoBold();

    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageTheme: pw.PageTheme(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(1.5 * PdfPageFormat.cm),
        ),
        header: (context) => pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            if (logoImage != null) pw.Image(logoImage, height: 35),
            pw.Text('г. $city, ${dfShort.format(dateRegistracii)} г.',
                style: pw.TextStyle(font: font, fontSize: 10)),
          ],
        ),
        footer: (context) => pw.Column(
          children: [
            pw.Divider(thickness: 0.5, color: PdfColors.grey400),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  child: pw.Text(
                      'Дополнительное соглашение ДС-$nomerDS к Договору № $nomerDogovora',
                      style: pw.TextStyle(
                          font: font, fontSize: 7, color: PdfColors.grey700)),
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text('Визуализация электронного документа.',
                        style: pw.TextStyle(
                            font: font, fontSize: 7, color: PdfColors.grey700)),
                    pw.Text(
                        'Сформировано в CRM "R-CORE". Дата/Время: $currentTime',
                        style: pw.TextStyle(
                            font: font, fontSize: 7, color: PdfColors.grey700)),
                  ],
                ),
              ],
            ),
          ],
        ),
        build: (context) => [
          pw.Stack(
            children: [
              if (logoImage != null)
                pw.Opacity(
                    opacity: 0.05,
                    child: pw.Center(child: pw.Image(logoImage, width: 350))),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(height: 10),
                  pw.Center(
                      child: pw.Text('ДОПОЛНИТЕЛЬНОЕ СОГЛАШЕНИЕ № ДС-$nomerDS',
                          style: pw.TextStyle(font: boldFont, fontSize: 11))),
                  pw.Center(
                      child: pw.Text(
                          'К Договору аренды № $nomerDogovora от ${dfShort.format(dateDogovora)} г.',
                          style: pw.TextStyle(font: font, fontSize: 9))),
                  pw.SizedBox(height: 15),

                  pw.RichText(
                    textAlign: pw.TextAlign.justify,
                    text: pw.TextSpan(
                      style: pw.TextStyle(
                          font: font, fontSize: 9, lineSpacing: 1.4),
                      children: [
                        pw.TextSpan(
                            text:
                                'ИП «$nameCompany», ИИН $iinCompany в лице $familiyaHozyainaCompani $imyaHozyainaCompani ${otchestvoHozyainaCompani ?? ""}, действующей на основании талона, именуемое далее «Арендодатель» с одной Стороны и '),
                        pw.TextSpan(
                            text: '$dataClienta, ИИН $iinClienta ',
                            style: pw.TextStyle(font: boldFont)),
                        pw.TextSpan(
                            text:
                                'именуемый в дальнейшем «Арендатор», с другой Стороны, совместно именуемые «Стороны» заключили настоящее Дополнительное соглашение к Договору аренды № $nomerDogovora от ${dfShort.format(dateDogovora)} г. о нижеследующем:'),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 15),

                  _itemTextDS(font, boldFont, "1.",
                      "Внести дополнение в п. 2.1.1 Договора и изложить его в следующей редакции: «С письменного согласия Арендодателя, срок аренды считается продленным на тех же условиях, если Арендатор до окончания срока действия аренды уведомил Арендодателя о своем желании продления. Согласование Сторонами срока производится посредством приложения WhatsApp либо с помощью смс-сообщений через указанные в договоре номера сотовых телефонов. При получении извещения от Арендатора о продлении срока аренды, Арендодатель составляет Дополнительное Соглашение к Договору с указанием срока продления Аренды. Продлить аренду на период с ${dtf.format(dateNachala)} г. до ${dtf.format(dateOkonchaniya)} г. (Арендная плата за сутки составляет – ${cenaArendy.toInt()} тенге, стоимость выезда за пределы г.Астана – ${(cenaViezda ?? 0).toInt()} тенге) итого общая сумма к оплате составляет – ${obchayaStoimost.toInt()} тенге."),
                  _itemTextDS(font, boldFont, "2.",
                      "Все остальные условия Договора остаются без изменений."),
                  _itemTextDS(font, boldFont, "3.",
                      "Настоящее Соглашение является неотъемлемой частью Договора."),
                  _itemTextDS(font, boldFont, "4.",
                      "Настоящее Соглашение вступает в силу с момента подписания Сторонами и действует до окончания действия Договора."),

                  pw.SizedBox(height: 25),

                  // БЛОК РЕКВИЗИТОВ
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Expanded(
                        child: pw.Stack(
                          overflow: pw.Overflow.visible,
                          children: [
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text('АРЕНДОДАТЕЛЬ:',
                                    style: pw.TextStyle(
                                        font: boldFont, fontSize: 9)),
                                pw.Divider(thickness: 0.5),
                                pw.Text('ИП "$nameCompany"',
                                    style: pw.TextStyle(
                                        font: boldFont, fontSize: 8)),
                                pw.Text('ИИН/БИН: $iinCompany',
                                    style:
                                        pw.TextStyle(font: font, fontSize: 8)),
                                pw.Text('Адрес: $adresRegistracii',
                                    style:
                                        pw.TextStyle(font: font, fontSize: 8)),
                                pw.Text('IIK: $iikCompany',
                                    style:
                                        pw.TextStyle(font: font, fontSize: 8)),
                                pw.Text('БИК: $bikCompany',
                                    style:
                                        pw.TextStyle(font: font, fontSize: 8)),
                                pw.Text('КБе: $kbeCompany',
                                    style:
                                        pw.TextStyle(font: font, fontSize: 8)),
                                pw.Text(
                                    'Руководитель: $familiyaHozyainaCompani ${imyaHozyainaCompani[0]}.',
                                    style: pw.TextStyle(
                                        font: boldFont, fontSize: 8)),
                                pw.SizedBox(height: 20),
                                pw.Text('(подпись / М.П.) ____________________',
                                    style: pw.TextStyle(
                                        font: font,
                                        fontSize: 7,
                                        color: PdfColors.grey700)),
                              ],
                            ),
                            // ПЕЧАТЬ ОТОБРАЖАЕТСЯ ТОЛЬКО ЕСЛИ STATUS = TRUE
                            if (status == true && stampImage != null)
                              pw.Positioned(
                                right: 0,
                                top: 40,
                                child: pw.Opacity(
                                  opacity: 0.85,
                                  child: pw.Image(stampImage,
                                      width: 85, height: 85),
                                ),
                              ),
                          ],
                        ),
                      ),
                      pw.SizedBox(width: 30),
                      pw.Expanded(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('АРЕНДАТОР:',
                                style:
                                    pw.TextStyle(font: boldFont, fontSize: 9)),
                            pw.Divider(thickness: 0.5),
                            pw.Text(dataClienta,
                                style:
                                    pw.TextStyle(font: boldFont, fontSize: 8)),
                            pw.Text('ИИН: $iinClienta',
                                style: pw.TextStyle(font: font, fontSize: 8)),
                            pw.Text(
                                'Уд. личности №: $nomerudostovereniya выдано ${dfShort.format(dateVydachiClient)} $cemVydanoClient',
                                style: pw.TextStyle(font: font, fontSize: 8)),
                            pw.Text('Адрес прописки: $adresRegistraciiClienta',
                                style: pw.TextStyle(font: font, fontSize: 8)),
                            pw.Text(
                                'Адрес проживания: $adresprozhivaniyaClienta',
                                style: pw.TextStyle(font: font, fontSize: 8)),
                            pw.Text('Тел: $nomerTelehonaClient',
                                style: pw.TextStyle(font: font, fontSize: 8)),
                            pw.SizedBox(height: 25),
                            pw.Text('(подпись) ____________________',
                                style: pw.TextStyle(
                                    font: font,
                                    fontSize: 7,
                                    color: PdfColors.grey700)),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // СИНЯЯ РАМКА ПЭП ПОКАЗЫВАЕТСЯ ТОЛЬКО ПРИ STATUS = TRUE
                  if (status == true)
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(top: 25),
                      child: pw.Container(
                        padding: const pw.EdgeInsets.all(10),
                        decoration: pw.BoxDecoration(
                          border:
                              pw.Border.all(color: PdfColors.blue900, width: 2),
                          borderRadius:
                              const pw.BorderRadius.all(pw.Radius.circular(5)),
                        ),
                        child: pw.Column(
                          children: [
                            pw.Center(
                                child: pw.Text(
                                    'ДОКУМЕНТ ПОДПИСАН С ИСПОЛЬЗОВАНИЕМ ПРОСТОЙ ЭЛЕКТРОННОЙ ПОДПИСИ (ПЭП)',
                                    style: pw.TextStyle(
                                        font: boldFont,
                                        fontSize: 9,
                                        color: PdfColors.blue900))),
                            pw.SizedBox(height: 10),
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Expanded(
                                    child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text('АРЕНДОДАТЕЛЬ:',
                                        style: pw.TextStyle(
                                            font: boldFont, fontSize: 8)),
                                    pw.Text('ИП "$nameCompany"',
                                        style: pw.TextStyle(
                                            font: font, fontSize: 8)),
                                    pw.Text(
                                        'Документ сгенерированный системой CRM "R-CORE" является подписанным со стороны Арендодателя',
                                        style: pw.TextStyle(
                                            font: font,
                                            fontSize: 7,
                                            color: PdfColors.grey700)),
                                    pw.Text('СТАТУС: ПОДПИСАНО',
                                        style: pw.TextStyle(
                                            font: boldFont,
                                            fontSize: 8,
                                            color: PdfColors.green800)),
                                  ],
                                )),
                                pw.Expanded(
                                    child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text('АРЕНДАТОР:',
                                        style: pw.TextStyle(
                                            font: boldFont, fontSize: 8)),
                                    pw.Text(dataClienta,
                                        style: pw.TextStyle(
                                            font: boldFont, fontSize: 8)),
                                    pw.Text('ИИН: $iinClienta',
                                        style: pw.TextStyle(
                                            font: font, fontSize: 8)),
                                    pw.SizedBox(height: 4),
                                    pw.Text('СТАТУС: ПОДПИСАНО ПЭП',
                                        style: pw.TextStyle(
                                            font: boldFont,
                                            fontSize: 8,
                                            color: PdfColors.green800)),
                                    pw.Text(
                                        'Подпись подтверждена через WhatsApp ($nomerTelehonaClient)',
                                        style: pw.TextStyle(
                                            font: font, fontSize: 7)),
                                    pw.Text(
                                        'Код подтверждения: ${smsCode ?? "verified"}',
                                        style: pw.TextStyle(
                                            font: boldFont,
                                            fontSize: 8,
                                            color: PdfColors.green800)),
                                    pw.Text(
                                        'Дата и время подписи: $currentTime',
                                        style: pw.TextStyle(
                                            font: font, fontSize: 7)),
                                  ],
                                )),
                              ],
                            ),
                            pw.SizedBox(height: 8),
                            pw.Divider(
                                thickness: 0.5, color: PdfColors.blue900),
                            pw.Text(
                                'Согласно ст. 7 Закона РК «Об электронном документе и электронной цифровой подписи» и ст. 20-1 Закона РК «Об информатизации» № 418-V (в ред. от 21.05.2024 № 86-VIII), данный документ в электронной форме признается равнозначным документу на бумажном носителе.',
                                style: pw.TextStyle(
                                    font: font,
                                    fontSize: 6,
                                    color: PdfColors.grey700)),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

    final Uint8List pdfBytes = await pdf.save();
    final String path =
        'dop_soglasheniya/DS_${nomerDS}_k_dogovoru_$nomerDogovora.pdf';
    await supabase.storage.from('contracts').uploadBinary(path, pdfBytes,
        fileOptions:
            const FileOptions(contentType: 'application/pdf', upsert: true));

    return supabase.storage.from('contracts').getPublicUrl(path);
  } catch (e) {
    return null;
  }
}

pw.Widget _itemTextDS(
    pw.Font font, pw.Font boldFont, String step, String text) {
  return pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 6),
    child: pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(
            width: 15,
            child: pw.Text(step,
                style: pw.TextStyle(font: boldFont, fontSize: 9))),
        pw.Expanded(
            child: pw.Text(text,
                style: pw.TextStyle(font: font, fontSize: 9),
                textAlign: pw.TextAlign.justify)),
      ],
    ),
  );
}
