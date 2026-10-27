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

Future<String?> generateSubleaseContract(
  DateTime dataDogovora,
  DateTime dataOkonchaniya,
  String logoUrl,
  String pechatUrl,
  String? smsKod, // Код подтверждения ПЭП (null при raspechatat = true)
  bool raspechatat, // true - печать (без рамки и печати), false - электронно
  bool viewedDogovor, // true - подписан/просмотрен, false - еще не подписан
  bool ficsa, // false - процентная ставка, true - фиксированная оплата
  // Данные Партнера (Собственник авто / Сторона-2)
  String partnerFio,
  String partnerIin,
  String partnerDokNum,
  String partnerDokVydan,
  String partnerDokData,
  String partnerTelefon,
  // Данные Арендатора (ИП / Директор - Сторона-1)
  String kompNaimenovanie,
  String kompDirektorFio,
  String kompDirektorIin,
  String kompDirektorDokNum,
  String kompDirektorDokVydan,
  String kompDirektorDokData,
  // Характеристики Автомобиля
  String avtoMarka,
  String avtoModel,
  String avtoGosNomer,
  String avtoVin,
  String avtoGodVypuska,
  String avtoCvet,
  String avtoSpts,
  String avtoToplivo,
  // Финансы
  String dohodProcent, // Используется, если ficsa = false
  String ficsirovannaYaPlata, // Используется, если ficsa = true
  String avtoStoimost,
) async {
  try {
    final supabase = Supabase.instance.client;
    final DateFormat df = DateFormat('dd.MM.yyyy', 'ru');
    final DateFormat dtf = DateFormat('HH:mm ч. dd MMMM yyyy', 'ru');

    final logoResponse = await http.get(Uri.parse(logoUrl));
    if (logoResponse.statusCode != 200) throw Exception('Failed to load logo');
    final logoImage = pw.MemoryImage(logoResponse.bodyBytes);

    final pechatResponse = await http.get(Uri.parse(pechatUrl));
    if (pechatResponse.statusCode != 200)
      throw Exception('Failed to load stamp');
    final pechatImage = pw.MemoryImage(pechatResponse.bodyBytes);

    final font = await PdfGoogleFonts.montserratRegular();
    final boldFont = await PdfGoogleFonts.montserratBold();

    // Динамический пункт 1.2 в зависимости от ficsa
    String punkt12Text = ficsa
        ? "1.2. За пользование транспортным средством Сторона-1 обязуется ежемесячно выплачивать Стороне-2 сумму в размере $ficsirovannaYaPlata тг. до 5-го числа каждого месяца за предыдущий месяц."
        : "1.2. За пользование транспортным средством, Сторона-1 обязуется ежемесячно выплачивать Стороне-2 сумму в размере $dohodProcent% от ежемесячного чистого дохода данного транспортного средства, который отображается в мобильном приложении R-CORE CRM. Выплаты будут производится ежемесячно, равными долями, до 5го числа каждого месяца за предыдущий месяц.";

    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageTheme: pw.PageTheme(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(1.5 * PdfPageFormat.cm),
          buildBackground: (context) => pw.Center(
            child: pw.Opacity(
              opacity: 0.1,
              child: pw.Image(logoImage, height: 400),
            ),
          ),
        ),
        header: (context) => pw.Align(
          alignment: pw.Alignment.topRight,
          child: pw.Text(
            'г. Астана\nДоговор субаренды от ${df.format(dataDogovora)} г.',
            style:
                pw.TextStyle(font: font, fontSize: 8, color: PdfColors.grey700),
            textAlign: pw.TextAlign.right,
          ),
        ),
        // ФУТЕР С НУМЕРАЦИЕЙ СТРАНИЦ ("стр. 1 из 3")
        footer: (context) => pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'стр. ${context.pageNumber} из ${context.pagesCount}',
              style: pw.TextStyle(
                  font: font, fontSize: 7, color: PdfColors.grey700),
            ),
            pw.Text(
              raspechatat
                  ? 'Сформировано в R-CORE CRM'
                  : 'Визуализация электронного документа R-CORE CRM. ${dtf.format(DateTime.now())}',
              style:
                  pw.TextStyle(font: font, fontSize: 7, color: PdfColors.grey),
            ),
          ],
        ),
        build: (context) => [
          pw.SizedBox(height: 5),
          pw.Center(
            child: pw.Text(
              "ДОГОВОР СУБАРЕНДЫ",
              style: pw.TextStyle(font: boldFont, fontSize: 11),
              textAlign: pw.TextAlign.center,
            ),
          ),
          pw.SizedBox(height: 10),
          _itemText(
            font,
            "ИП «$kompNaimenovanie», в лице $kompDirektorFio, ИИН $kompDirektorIin именуемый в дальнейшем «Сторона-1», с одной стороны, и $partnerFio, ИИН: $partnerIin именуемый в дальнейшем «Сторона-2», с другой стороны, совместно именуемые «Стороны», по отдельности как указано выше или «Стороны», заключили настоящий договор о нижеследующем.",
          ),
          pw.SizedBox(height: 8),
          pw.Text("1. ПРЕДМЕТ ДОГОВОРА",
              style: pw.TextStyle(font: boldFont, fontSize: 10)),
          pw.SizedBox(height: 4),
          _itemText(
            font,
            "1.1. Сторона-2 передает Стороне-1 во временное пользование автомобиль марки: $avtoMarka $avtoModel с техническими характеристиками:",
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 15, top: 4, bottom: 4),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _specRow(font, "1)", "государственный номер", avtoGosNomer,
                    boldFont),
                _specRow(font, "2)", "год выпуска", avtoGodVypuska, boldFont),
                _specRow(font, "3)", "Номер кузова:", avtoVin, boldFont),
                _specRow(font, "4)", "Цвет автомобиля:", avtoCvet, boldFont),
                _specRow(font, "5)", "Свидетельство о регистрации:", avtoSpts,
                    boldFont),
                _specRow(font, "6)", "Топливо:", avtoToplivo, boldFont),
              ],
            ),
          ),
          _itemText(
            font,
            "Сторона-1 обязуется возвратить Транспортное средство Стороне-2 после истечения срока действия настоящего договора в том состоянии, в котором она его получила, с учетом нормального износа.",
          ),
          _itemText(font, punkt12Text),
          _itemText(
            font,
            "1.3. Сторона-2, с момента подписания настоящего договора обязуется предоставить Стороне-1 все документы, необходимые для использования Транспортного средства в связи с заключением настоящего договора.",
          ),
          pw.SizedBox(height: 8),
          pw.Text("2. ПЕРЕДАЧА И ИСПОЛЬЗОВАНИЕ ТРАНСПОРТНОГО СРЕДСТВА",
              style: pw.TextStyle(font: boldFont, fontSize: 10)),
          pw.SizedBox(height: 4),
          _itemText(font,
              "2.1. Сторона-2 обязуется передать Стороне-1 Транспортное средство сразу с момента подписания настоящего договора."),
          _itemText(font,
              "2.2. Передача Транспортного средства осуществляется в соответствии с актом приема-передачи, который подписывается Сторонами."),
          _itemText(font,
              "2.3. Сторона-1 обязуется произвести полный осмотр Транспортного средства при его приемке на предмет наличия любых недостатков."),
          _itemText(font,
              "2.4. В случае обнаружения Стороной-1 любых недостатков Транспортного средства при его приемке, которые, по мнению Стороны-1, являются либо могут являться препятствием для принятия во временное владение и пользование, а также для осуществления деятельности Стороной-1, Сторона-1 имеет право отказаться от приемки Транспортного средства и расторгнуть настоящий договор в одностороннем порядке без обращения в суд и без предварительного уведомления Стороны-2."),
          _itemText(font,
              "2.5. Подписание акта приема-передачи Транспортного средства означает полное отсутствие каких-либо претензий Стороны-1 к Транспортному средству и ее согласие принять Транспортное средство в том состоянии, в котором Транспортное средство находится в момент передачи."),
          _itemText(font,
              "2.6. Транспортное средство предоставляется во временное владение и пользование Стороне-1 в целях предоставления его в аренду третьим лицам."),

          pw.SizedBox(height: 8),
          pw.Text("3. ОБЯЗАННОСТИ СТОРОН",
              style: pw.TextStyle(font: boldFont, fontSize: 10)),
          pw.SizedBox(height: 4),
          _itemText(font, "3.1. Сторона-2 обязуется:"),
          _itemText(font,
              "3.1.1. Уведомлять Сторону-1 о всех наложенных обременениях на транспортное средство, в том числе и о наличии административных штрафов;"),
          _itemText(font,
              "3.1.2. При передаче транспортного средства рассказать о всех дефектах автомобиля."),
          _itemText(font,
              "3.1.3. Перед изъятием автомобиля, уведомить об этом Сторону-1 как минимум за 30 (тридцать) календарных дней."),
          _itemText(font, "3.2. Сторона-1 обязуется:"),
          _itemText(font,
              "3.2.1. Использовать Транспортное средство исключительно в соответствии с назначением, предусмотренным п. 2.6. настоящего договора;"),
          _itemText(font,
              "3.2.2. Страховать Транспортное средство и страховать ответственность за ущерб, который может быть причинен им или в связи с его эксплуатацией в соответствии с законодательством Республики Казахстан;"),
          _itemText(font,
              "3.2.3. Осуществлять эксплуатацию и содержать Транспортное средство в соответствии с требованиями законодательства Республики Казахстан;"),
          _itemText(font,
              "3.2.4. Обеспечивать текущий ремонт Транспортного средства по мере возникновения необходимости в его проведении;"),
          _itemText(font,
              "3.2.5. Возвратить Стороне-2 Транспортное средство в течение 30 (тридцати) календарных дней с момента уведомления о возврате по акту приема-передачи в состоянии, в котором она его получила, с учетом нормального естественного износа."),
          _itemText(font,
              "3.2.6. В случае причинения вреда вышеперечисленным автомобилем свыше 500 000 тенге."),

          pw.SizedBox(height: 8),
          pw.Text("4. ОТВЕТСТВЕННОСТЬ СТОРОН",
              style: pw.TextStyle(font: boldFont, fontSize: 10)),
          pw.SizedBox(height: 4),
          _itemText(font,
              "4.1. В случае неисполнения или ненадлежащего исполнения своих обязательств по настоящему договору Стороны несут ответственность в соответствии с законодательством Республики Казахстан."),
          _itemText(font,
              "4.2. Сторона-2 не несет ответственности перед третьими лицами в случае причинения им какого-либо ущерба либо вреда."),

          pw.SizedBox(height: 8),
          pw.Text("5. ЗАКЛЮЧИТЕЛЬНЫЕ ПОЛОЖЕНИЯ",
              style: pw.TextStyle(font: boldFont, fontSize: 10)),
          pw.SizedBox(height: 4),
          _itemText(font,
              "5.1. Настоящий договор вступает в силу с момента его подписания Сторонами и действует до ${df.format(dataOkonchaniya)} г. с возможностью продления. Договор считается продленным в случае, если обе Стороны проставят новый срок действия договора и подписи в конце данного договора."),
          _itemText(font,
              "5.2. Все изменения и дополнения к настоящему договору должны быть совершены в письменной форме и подписаны Сторонами или их представителями."),
          _itemText(font,
              "5.3. Все споры, вытекающие из настоящего договора, разрешаются путем переговоров между Сторонами. В случае невозможности разрешения споров путем переговоров, споры разрешаются в соответствии с законодательством Республики Казахстан."),
          _itemText(font,
              "5.4. Во всем остальном, что не предусмотрено настоящим договором, Стороны руководствуются законодательством Республики Казахстан."),
          _itemText(font,
              "5.5. Настоящий договор составлен в двух экземплярах, имеющих одинаковую юридическую силу, по одному для каждой из Сторон."),

          pw.SizedBox(height: 15),
          pw.Text("РЕКВИЗИТЫ СТОРОН",
              style: pw.TextStyle(font: boldFont, fontSize: 10)),
          pw.SizedBox(height: 8),

          // БЛОК РЕКВИЗИТОВ
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(
                child: pw.Stack(
                  overflow: pw.Overflow.visible,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('СТОРОНА-1 (АРЕНДАТОР):',
                            style: pw.TextStyle(font: boldFont, fontSize: 8)),
                        pw.Divider(thickness: 0.5),
                        pw.Text('ИП «$kompNaimenovanie»',
                            style: pw.TextStyle(font: boldFont, fontSize: 8)),
                        pw.Text('В лице: $kompDirektorFio',
                            style: pw.TextStyle(font: font, fontSize: 8)),
                        pw.Text('ИИН: $kompDirektorIin',
                            style: pw.TextStyle(font: font, fontSize: 8)),
                        pw.Text(
                            'Уд. личн. № $kompDirektorDokNum выдан $kompDirektorDokVydan от $kompDirektorDokData г.',
                            style: pw.TextStyle(font: font, fontSize: 8)),
                        pw.Text('Статус: ПОДПИСАНО',
                            style: pw.TextStyle(
                                font: boldFont,
                                fontSize: 8,
                                color: PdfColors.green800)),
                      ],
                    ),
                    // ПЕЧАТЬ
                    if (!raspechatat && viewedDogovor)
                      pw.Positioned(
                        right: 0,
                        top: 0,
                        child: pw.Opacity(
                          opacity: 0.85,
                          child: pw.Image(pechatImage, width: 90, height: 90),
                        ),
                      ),
                  ],
                ),
              ),
              pw.SizedBox(width: 20),
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('СТОРОНА-2 (СОБСТВЕННИК):',
                        style: pw.TextStyle(font: boldFont, fontSize: 8)),
                    pw.Divider(thickness: 0.5),
                    pw.Text(partnerFio,
                        style: pw.TextStyle(font: boldFont, fontSize: 8)),
                    pw.Text('ИИН: $partnerIin',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text(
                        'Уд. личн. № $partnerDokNum выдан $partnerDokVydan от $partnerDokData',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text('Тел: $partnerTelefon',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text(
                      raspechatat
                          ? 'Статус: К ОФОРМЛЕНИЮ'
                          : (viewedDogovor
                              ? 'Статус: ПОДПИСАНО ПЭП'
                              : 'Статус: ОЖИДАЕТ ПОДПИСАНИЯ'),
                      style: pw.TextStyle(
                          font: boldFont,
                          fontSize: 8,
                          color: raspechatat
                              ? PdfColors.grey700
                              : (viewedDogovor
                                  ? PdfColors.green800
                                  : PdfColors.orange800)),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // УСЛОВНЫЙ РЕНДЕРИНГ ПОДПИСИ И РАМКИ ПЭП
          if (raspechatat)
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 30),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        width: 200,
                        decoration: const pw.BoxDecoration(
                            border: pw.Border(bottom: pw.BorderSide(width: 1))),
                      ),
                      pw.SizedBox(height: 2),
                      pw.Text('(подпись / М.П. Стороны-1)',
                          style: pw.TextStyle(font: font, fontSize: 7)),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        width: 200,
                        decoration: const pw.BoxDecoration(
                            border: pw.Border(bottom: pw.BorderSide(width: 1))),
                      ),
                      pw.SizedBox(height: 2),
                      pw.Text('(подпись Стороны-2)',
                          style: pw.TextStyle(font: font, fontSize: 7)),
                    ],
                  ),
                ],
              ),
            )
          else if (viewedDogovor)
            // РАМКА ПЭП ПОКАЗЫВАЕТСЯ ТОЛЬКО ЕСЛИ viewedDogovor == true
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 15),
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
                      child: pw.Text('ДОГОВОР АРЕНДЫ ПОДПИСАН ПЭП',
                          style: pw.TextStyle(
                              font: boldFont,
                              fontSize: 9,
                              color: PdfColors.blue900)),
                    ),
                    pw.SizedBox(height: 8),
                    pw.Text('СТОРОНА-2 (Собственник): $partnerFio',
                        style: pw.TextStyle(font: boldFont, fontSize: 8)),
                    pw.Text('ИИН: $partnerIin | Телефон: $partnerTelefon',
                        style: pw.TextStyle(font: font, fontSize: 8)),
                    pw.Text(
                        'Статус: ПОДПИСАНО ПЭП (Простой электронной подписью)',
                        style: pw.TextStyle(
                            font: boldFont,
                            fontSize: 8,
                            color: PdfColors.green800)),
                    pw.Text(
                        'Подпись подтверждена SMS-кодом отправленным на WhatsApp',
                        style: pw.TextStyle(font: font, fontSize: 7)),
                    pw.Text(
                        'Код: ${smsKod ?? "****"}. Время: ${dtf.format(DateTime.now())}',
                        style: pw.TextStyle(
                            font: boldFont,
                            fontSize: 8,
                            color: PdfColors.green800)),
                    pw.SizedBox(height: 6),
                    pw.Divider(thickness: 0.5, color: PdfColors.blue900),
                    pw.Text(
                      'Согласно ст. 7 Закона РК «Об электронном документе и электронной цифровой подписи», данный документ признается равнозначным бумажному.',
                      style: pw.TextStyle(
                          font: font, fontSize: 6, color: PdfColors.grey700),
                    ),
                  ],
                ),
              ),
            )
          else
            // ЗАГЛУШКА ЕСЛИ ДОКУМЕНТ ЕЩЕ НЕ ПОДПИСАН (viewedDogovor == false)
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 15),
              child: pw.Container(
                padding: const pw.EdgeInsets.all(10),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.grey400, width: 1),
                  borderRadius:
                      const pw.BorderRadius.all(pw.Radius.circular(5)),
                ),
                child: pw.Center(
                  child: pw.Text(
                    'ДОКУМЕНТ ОЖИДАЕТ ПОДПИСАНИЯ ПЭП СТОРОНОЙ-2',
                    style: pw.TextStyle(
                        font: boldFont, fontSize: 8, color: PdfColors.grey700),
                  ),
                ),
              ),
            ),
        ],
      ),
    );

    final Uint8List pdfBytes = await pdf.save();
    final String polnyiPut =
        'sublease_contracts/contract_sublease_${DateTime.now().millisecondsSinceEpoch}.pdf';

    await supabase.storage.from('contracts').uploadBinary(
          polnyiPut,
          pdfBytes,
          fileOptions:
              const FileOptions(upsert: true, contentType: 'application/pdf'),
        );

    return supabase.storage.from('contracts').getPublicUrl(polnyiPut);
  } catch (e) {
    print('PDF Error: $e');
    return null;
  }
}

pw.Widget _specRow(
    pw.Font font, String index, String label, String val, pw.Font boldFont) {
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(vertical: 1),
    child: pw.Row(children: [
      pw.SizedBox(
          width: 15,
          child: pw.Text(index, style: pw.TextStyle(font: font, fontSize: 8))),
      pw.SizedBox(
          width: 150,
          child: pw.Text(label,
              style: pw.TextStyle(
                  font: font, fontSize: 8, color: PdfColors.grey700))),
      pw.Expanded(
          child:
              pw.Text(val, style: pw.TextStyle(font: boldFont, fontSize: 8))),
    ]),
  );
}

pw.Widget _itemText(pw.Font font, String text) {
  return pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 4),
    child: pw.Text(text,
        style: pw.TextStyle(font: font, fontSize: 8.5),
        textAlign: pw.TextAlign.justify),
  );
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
