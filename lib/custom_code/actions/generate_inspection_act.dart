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
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> generateInspectionAct(
  String nomerDogovora,
  DateTime dateDogovora,
  String logoUrl,
  String? signCode,
  String compName,
  String compIIN,
  String compAddress,
  String compPhone,
  String compDirectorSurname,
  String compDirectorName,
  String? compDirectorFather,
  String compDirDocs,
  DateTime compDirDocsDate,
  String compDirDocsVydan,
  String compIIK,
  String compBIK,
  String compKBE,
  String compBankName,
  String clientFio,
  String clientIIN,
  String clientSurname,
  String clientName,
  String? clientFather,
  String clientDocNum,
  String clientDocsVydan,
  DateTime? clientDocDate,
  String clientAddressReg,
  String? clientAddressLive,
  String clientPhone,
  String? clientMail,
  String carMarka,
  String carModel,
  String carPlate,
  String carVin,
  String carYear,
  String carColor,
  String carFuel,
  String carValue,
  String carMileage,
  DateTime startDate,
  DateTime endDate,
  List<String> equipmentList,
  bool raspechatat,
  String stampUrl,
  bool yurLica, // Переключатель Юр/Физ лицо (bool)
  String? clientCompanyName, // Наименование компании
  String? clientAddressRegComp, // Юр. адрес компании
  String? directorSurname, // Фамилия директора
  String? directorName, // Имя директора
  String? directorFather, // Отчество директора
  String? directorDocNum, // ИИН/Документ директора
  String? clientBankName, // Наименование банка клиента
  String? clientIIK, // ИИК клиента
  String? clientBIK, // БИК клиента
  String? clientKBE, // КБЕ клиента
  String? companyBIN, // БИН организации
  String? dircompanyIIN, // ИИН директора организации
  bool
      status, // Статус подписи (true - подписан ПЭП / false - проект без печати и рамки)
) async {
  try {
    final supabase = Supabase.instance.client;
    final DateFormat df = DateFormat('dd.MM.yyyy', 'ru');
    final DateFormat dtf = DateFormat('dd.MM.yyyy HH:mm', 'ru');
    final DateFormat dfLong = DateFormat('«d» MMMM yyyy', 'ru');

    final logoResponse = await http.get(Uri.parse(logoUrl));
    if (logoResponse.statusCode != 200) throw Exception('Failed to load logo');
    final logoImage = pw.MemoryImage(logoResponse.bodyBytes);

    pw.MemoryImage? stampImage;
    if (status) {
      final stampResponse = await http.get(Uri.parse(stampUrl));
      if (stampResponse.statusCode == 200) {
        stampImage = pw.MemoryImage(stampResponse.bodyBytes);
      }
    }

    final font = await PdfGoogleFonts.montserratRegular();
    final boldFont = await PdfGoogleFonts.montserratBold();

    // Сборка ФИО директора / руководителя
    String directorFIO = yurLica
        ? '${directorSurname ?? clientSurname} ${directorName ?? clientName} ${directorFather ?? clientFather ?? ""}'
            .trim()
        : clientFio;

    // Динамическая преамбула
    String clientPreamble = yurLica
        ? "гр. $clientFio, ИИН: $clientIIN, сотрудник компании «${clientCompanyName ?? ""}», БИН: $companyBIN, действующий в интересах руководителя компании «${clientCompanyName ?? ""}» $directorFIO, ИИН: ${dircompanyIIN ?? ""}, и принимающий на себя полную материальную ответственность за сохранность ТС, именуемый в дальнейшем «Арендатор»"
        : "гр. $clientFio, ИИН $clientIIN, уд. личности № $clientDocNum, выданный $clientDocsVydan от ${clientDocDate != null ? df.format(clientDocDate) : ""}, именуемый в дальнейшем «Арендатор»";

    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageTheme: pw.PageTheme(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(1.5 * PdfPageFormat.cm),
          buildBackground: (context) => pw.Center(
            child: pw.Opacity(
                opacity: 0.1, child: pw.Image(logoImage, height: 400)),
          ),
        ),
        header: (context) => pw.Align(
          alignment: pw.Alignment.topRight,
          child: pw.Text(
            'Приложение № 1 к Договору аренды № $nomerDogovora\nот ${dfLong.format(dateDogovora)} г.',
            style: pw.TextStyle(font: font, fontSize: 8),
            textAlign: pw.TextAlign.right,
          ),
        ),
        footer: (context) => pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              raspechatat || yurLica
                  ? 'Сформировано в ИС CRM "R-CORE"'
                  : 'Визуализация электронного документа R-CORE CRM. ${dtf.format(DateTime.now())}',
              style:
                  pw.TextStyle(font: font, fontSize: 7, color: PdfColors.grey),
            ),
            pw.Text(
              'Стр. ${context.pageNumber} из ${context.pagesCount}',
              style: pw.TextStyle(
                  font: boldFont, fontSize: 7, color: PdfColors.grey800),
            ),
          ],
        ),
        build: (context) => [
          pw.SizedBox(height: 10),
          pw.Center(
              child: pw.Text("АКТ ПРИЕМА-ПЕРЕДАЧИ ТРАНСПОРТНОГО СРЕДСТВА",
                  style: pw.TextStyle(font: boldFont, fontSize: 12))),
          pw.SizedBox(height: 15),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _itemText(font,
                  "ИП «$compName», ИИН $compIIN именуемое далее «Арендодатель», в лице $compDirectorSurname $compDirectorName ${compDirectorFather ?? ""}, с одной стороны и $clientPreamble, с другой стороны, составили настоящий Акт приема-передачи автомобиля:"),
              _itemText(font,
                  "1. Арендодатель передает во временное владение и пользование, а Арендатор принимает Автомобиль."),
              _itemText(font,
                  "2. Автомобиль соответствует следующим идентификационным и техническим характеристикам:"),
            ],
          ),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(
                child: pw.Column(
                  children: [
                    _actRow(font, "Марка и модель", "$carMarka $carModel"),
                    _actRow(font, "Гос. номер", carPlate),
                    _actRow(font, "VIN код", carVin),
                    _actRow(font, "Год выпуска", carYear),
                    _actRow(font, "Цвет", carColor),
                  ],
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Expanded(
                child: pw.Column(
                  children: [
                    _actRow(font, "Пробег", "$carMileage км"),
                    _actRow(font, "Топливо", carFuel),
                    _actRow(font, "Стоимость ТС", "$carValue тг"),
                    _actRow(font, "Передача", "${dtf.format(startDate)} г."),
                    _actRow(font, "Возврат", "${dtf.format(endDate)} г."),
                  ],
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 10),
          pw.Text("Наименование имущества, переданного с автомобилем:",
              style: pw.TextStyle(font: boldFont, fontSize: 9)),
          pw.SizedBox(height: 5),
          pw.Table(border: pw.TableBorder.all(width: 0.5), children: [
            pw.TableRow(
                decoration: const pw.BoxDecoration(color: PdfColors.grey200),
                children: [
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(2),
                      child: pw.Text(" №",
                          style: pw.TextStyle(font: boldFont, fontSize: 8))),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(2),
                      child: pw.Text(" Наименование",
                          style: pw.TextStyle(font: boldFont, fontSize: 8))),
                  pw.Padding(
                      padding: const pw.EdgeInsets.all(2),
                      child: pw.Text(" Кол-во",
                          style: pw.TextStyle(font: boldFont, fontSize: 8))),
                ]),
            ...equipmentList
                .asMap()
                .entries
                .map((entry) => pw.TableRow(children: [
                      pw.Padding(
                          padding: const pw.EdgeInsets.all(2),
                          child: pw.Text(" ${entry.key + 1}",
                              style: pw.TextStyle(font: font, fontSize: 8))),
                      pw.Padding(
                          padding: const pw.EdgeInsets.all(2),
                          child: pw.Text(" ${entry.value}",
                              style: pw.TextStyle(font: font, fontSize: 8))),
                      pw.Padding(
                          padding: const pw.EdgeInsets.all(2),
                          child: pw.Text(" 1",
                              style: pw.TextStyle(font: font, fontSize: 8))),
                    ]))
                .toList(),
          ]),
          pw.SizedBox(height: 10),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _itemText(font,
                  "3. Автомобиль и переданное имущество приняты в исправном техническом состоянии."),
              _itemText(font,
                  "3.1. Лицо, фактически принявшее Автомобиль (Арендатор/Водитель), несет материальную ответственность за сохранность ТС, ключей и документов с момента подписания настоящего Акта."),
              _itemText(font,
                  "3.2. Стороны подтверждают отсутствие претензий по качеству и комплектности на момент передачи."),
              _itemText(font,
                  "4. Подписывая настоящий Акт, Стороны подтверждают исполнение обязательств."),
              _itemText(font,
                  "5. Акт является неотъемлемой частью Договора аренды № $nomerDogovora."),
            ],
          ),
          pw.SizedBox(height: 15),

          // БЛОК РЕКВИЗИТОВ СТОРОН
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // АРЕНДОДАТЕЛЬ
              pw.Expanded(
                child: pw.Stack(
                  children: [
                    pw.Column(
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
                        pw.SizedBox(height: 2),
                        pw.Text('Уд. личности № $compDirDocs',
                            style: pw.TextStyle(font: font, fontSize: 8)),
                        pw.Text('Банк: $compBankName',
                            style: pw.TextStyle(font: font, fontSize: 8)),
                        pw.Text('ИИК: $compIIK | БИК: $compBIK',
                            style: pw.TextStyle(font: font, fontSize: 8)),
                        pw.Text('Тел: $compPhone',
                            style: pw.TextStyle(font: font, fontSize: 8)),
                        pw.SizedBox(height: 4),
                        pw.Text(
                            'Руководитель: $compDirectorSurname ${compDirectorName.isNotEmpty ? compDirectorName[0] : ""}.',
                            style: pw.TextStyle(font: boldFont, fontSize: 8)),
                      ],
                    ),
                    // Печать накладывается ТОЛЬКО при status == true
                    if (status && stampImage != null)
                      pw.Positioned(
                        right: 10,
                        top: 15,
                        child: pw.Opacity(
                          opacity: 0.85,
                          child: pw.Image(stampImage, width: 85, height: 85),
                        ),
                      ),
                  ],
                ),
              ),
              pw.SizedBox(width: 25),
              // АРЕНДАТОР
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('АРЕНДАТОР:',
                        style: pw.TextStyle(font: boldFont, fontSize: 9)),
                    pw.Divider(thickness: 0.5),
                    if (yurLica) ...[
                      // --- ДАННЫЕ ЮР. ЛИЦА ---
                      pw.Text(
                          '${clientCompanyName ?? "Наименование организации"}',
                          style: pw.TextStyle(font: boldFont, fontSize: 8)),
                      pw.Text('БИН: $clientIIN',
                          style: pw.TextStyle(font: font, fontSize: 8)),
                      pw.Text(
                          'Адрес: ${clientAddressRegComp ?? clientAddressReg}',
                          style: pw.TextStyle(font: font, fontSize: 8)),
                      pw.Text(
                          'Банк: ${clientBankName ?? "-"} | ИИК: ${clientIIK ?? "-"}',
                          style: pw.TextStyle(font: font, fontSize: 8)),
                      pw.SizedBox(height: 3),
                      pw.Text(
                          'Руководитель: $directorFIO, ИИН: ${dircompanyIIN ?? "-"}',
                          style: pw.TextStyle(font: font, fontSize: 8)),
                      pw.SizedBox(height: 4),
                      pw.Text('ПРИНЯЛ И БЕРЕТ МАТ. ОТВЕТСТВЕННОСТЬ:',
                          style: pw.TextStyle(
                              font: boldFont,
                              fontSize: 7,
                              color: PdfColors.blue900)),
                      pw.Text('Водитель/Сотрудник: $clientFio',
                          style: pw.TextStyle(font: boldFont, fontSize: 8)),
                      pw.Text('ИИН: $clientIIN | Уд. личн. № $clientDocNum',
                          style: pw.TextStyle(font: font, fontSize: 8)),
                      pw.Text('Тел: $clientPhone',
                          style: pw.TextStyle(font: font, fontSize: 8)),
                    ] else ...[
                      // --- ДАННЫЕ ФИЗ. ЛИЦА ---
                      pw.Text(
                          '$clientSurname $clientName ${clientFather ?? ""}',
                          style: pw.TextStyle(font: boldFont, fontSize: 8)),
                      pw.Text('ИИН: $clientIIN',
                          style: pw.TextStyle(font: font, fontSize: 8)),
                      pw.Text('Уд. личности № $clientDocNum',
                          style: pw.TextStyle(font: font, fontSize: 8)),
                      pw.Text('Адрес: $clientAddressReg',
                          style: pw.TextStyle(font: font, fontSize: 8)),
                      pw.Text('Тел: $clientPhone',
                          style: pw.TextStyle(font: font, fontSize: 8)),
                    ],
                  ],
                ),
              ),
            ],
          ),

          // ВАРИАНТ 1: ДЛЯ БУМАЖНОЙ ПЕЧАТИ, ЮР. ЛИЦ ИЛИ ПРИ status == false
          if (raspechatat || yurLica || !status)
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 25),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.SizedBox(height: 20),
                      pw.Container(
                        width: 220,
                        decoration: const pw.BoxDecoration(
                            border: pw.Border(bottom: pw.BorderSide(width: 1))),
                      ),
                      pw.SizedBox(height: 2),
                      pw.Text('(подпись / М.П. Арендодателя)',
                          style: pw.TextStyle(font: font, fontSize: 7)),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.SizedBox(height: 20),
                      pw.Container(
                        width: 220,
                        decoration: const pw.BoxDecoration(
                            border: pw.Border(bottom: pw.BorderSide(width: 1))),
                      ),
                      pw.SizedBox(height: 2),
                      pw.Text(
                          yurLica
                              ? '(подпись водителя / М.П. Арендатора)'
                              : '(подпись Арендатора)',
                          style: pw.TextStyle(font: font, fontSize: 7)),
                    ],
                  ),
                ],
              ),
            ),

          // ВАРИАНТ 2: ДЛЯ ЭЛЕКТРОННОЙ ПОДПИСИ ФИЗ. ЛИЦ (Рамка ПЭП отображается ТОЛЬКО если status == true)
          if (!raspechatat && !yurLica && status) ...[
            pw.Spacer(),
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 20),
              child: pw.Container(
                padding: const pw.EdgeInsets.all(10),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.blue900, width: 2),
                  borderRadius:
                      const pw.BorderRadius.all(pw.Radius.circular(5)),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Center(
                        child: pw.Text('АКТ ПРИЕМА-ПЕРЕДАЧИ ПОДПИСАН ПЭП',
                            style: pw.TextStyle(
                                font: boldFont,
                                fontSize: 9,
                                color: PdfColors.blue900))),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Expanded(
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('АРЕНДОДАТЕЛЬ:',
                                  style: pw.TextStyle(
                                      font: boldFont, fontSize: 8)),
                              pw.Text('ИП "$compName"',
                                  style: pw.TextStyle(font: font, fontSize: 8)),
                              pw.Text('Статус: ПОДПИСАНО',
                                  style: pw.TextStyle(
                                      font: boldFont,
                                      fontSize: 8,
                                      color: PdfColors.green800)),
                              pw.Text(
                                  'Документ сформированный в ИС CRM "R-CORE" является подписанным со стороны Арендодателя',
                                  style: pw.TextStyle(font: font, fontSize: 7)),
                            ],
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('АРЕНДАТОР:',
                                  style: pw.TextStyle(
                                      font: boldFont, fontSize: 8)),
                              pw.Text(
                                  '$clientSurname $clientName ${clientFather ?? ""}',
                                  style: pw.TextStyle(font: font, fontSize: 8)),
                              pw.Text('ИИН: $clientIIN',
                                  style: pw.TextStyle(font: font, fontSize: 8)),
                              pw.Text(
                                  'Статус: ПОДПИСАНО ПЭП (Простой электронной подписью)',
                                  style: pw.TextStyle(
                                      font: boldFont,
                                      fontSize: 8,
                                      color: PdfColors.green800)),
                              pw.Text(
                                  'Подпись подтверждена SMS-кодом на мессенджер WhatsApp (номер телефона $clientPhone)',
                                  style: pw.TextStyle(font: font, fontSize: 7)),
                              pw.Text(
                                  'Код: ${signCode ?? "****"}. Время: ${dtf.format(DateTime.now())}',
                                  style: pw.TextStyle(
                                      font: boldFont,
                                      fontSize: 8,
                                      color: PdfColors.green800)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 10),
                    pw.Divider(thickness: 0.5, color: PdfColors.blue900),
                    pw.Text(
                      'Согласно ст. 7 Закона РК «Об электронном документе и электронной цифровой подписи» и ст. 20-1 Закона РК «Об информатизации», данный документ признается равнозначным бумажному.',
                      style: pw.TextStyle(
                          font: font, fontSize: 6, color: PdfColors.grey700),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );

    final Uint8List pdfBytes = await pdf.save();
    final String fullPath =
        'act_priema_peredachi/act_inspection_${nomerDogovora}_${DateTime.now().millisecondsSinceEpoch}.pdf';
    await supabase.storage.from('contracts').uploadBinary(fullPath, pdfBytes,
        fileOptions:
            const FileOptions(upsert: true, contentType: 'application/pdf'));
    return supabase.storage.from('contracts').getPublicUrl(fullPath);
  } catch (e) {
    print('PDF Error: $e');
    return null;
  }
}

pw.Widget _actRow(pw.Font font, String label, String val) {
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(vertical: 1),
    child: pw.Row(children: [
      pw.SizedBox(
          width: 85,
          child: pw.Text("$label:",
              style: pw.TextStyle(
                  font: font, fontSize: 9, color: PdfColors.grey700))),
      pw.Expanded(
          child: pw.Text(val, style: pw.TextStyle(font: font, fontSize: 9))),
    ]),
  );
}

pw.Widget _itemText(pw.Font font, String text) {
  return pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 2),
    child: pw.Text("      $text",
        style: pw.TextStyle(font: font, fontSize: 9),
        textAlign: pw.TextAlign.justify),
  );
}
