import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'dop_soglashenie_page_model.dart';
export 'dop_soglashenie_page_model.dart';

class DopSoglasheniePageWidget extends StatefulWidget {
  const DopSoglasheniePageWidget({
    super.key,
    this.id,
    this.type,
  });

  final String? id;
  final String? type;

  static String routeName = 'dop_soglashenie_page';
  static String routePath = '/dopSoglasheniePage';

  @override
  State<DopSoglasheniePageWidget> createState() =>
      _DopSoglasheniePageWidgetState();
}

class _DopSoglasheniePageWidgetState extends State<DopSoglasheniePageWidget> {
  late DopSoglasheniePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DopSoglasheniePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.podpis = '0';
      _model.progres = 0.01;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: FutureBuilder<List<DopSoglachenieRow>>(
                  future: DopSoglachenieTable().querySingleRow(
                    queryFn: (q) => q.eqOrNull(
                      'id',
                      widget!.id,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<DopSoglachenieRow> containerDopSoglachenieRowList =
                        snapshot.data!;

                    final containerDopSoglachenieRow =
                        containerDopSoglachenieRowList.isNotEmpty
                            ? containerDopSoglachenieRowList.first
                            : null;

                    return Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.92,
                      constraints: BoxConstraints(
                        maxWidth: 400.0,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    'Дополнительное соглашение к Договору №  ${containerDopSoglachenieRow?.nomerDogovora}  от ${dateTimeFormat("d MMM y", containerDopSoglachenieRow?.dateDogovora)}  г.',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 500.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 20.0, 15.0, 0.0),
                                  child: FlutterFlowPdfViewer(
                                    networkPath: containerDopSoglachenieRow!
                                        .urlDopSoglasheniya!,
                                    height: 268.9,
                                    horizontalScroll: false,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 20.0),
                                child: Container(
                                  height: 201.41,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFA5A7A9),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 5.0),
                                          child: Text(
                                            'Код для подписи Доп.соглашения - ${containerDopSoglachenieRow?.codPodpisi}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 10.0),
                                          child: Text(
                                            'Введя код вы подписываете Дополнительное соглашение к договору №  ${containerDopSoglachenieRow?.nomerDogovora}  от  ${dateTimeFormat("d MMM y", containerDopSoglachenieRow?.dateDogovora)}  г.  и подтверждаете безусловное согласие с его условиями',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Container(
                                            width: 250.0,
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  _model.code = _model
                                                      .textController.text;
                                                  safeSetState(() {});
                                                },
                                              ),
                                              autofocus: false,
                                              enabled: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                hintText: 'Ввести код',
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor: Color(0x00FFFFFF),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                              keyboardType:
                                                  TextInputType.number,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              enableInteractiveSelection: true,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        if (_model.podpis == '0')
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (_model.code ==
                                                    containerDopSoglachenieRow
                                                        ?.codPodpisi)
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.dsOut =
                                                          await actions
                                                              .generateDS(
                                                        containerDopSoglachenieRow!
                                                            .nomerDopSoglasheniya!,
                                                        containerDopSoglachenieRow!
                                                            .nomerDogovora!,
                                                        containerDopSoglachenieRow!
                                                            .dateDogovora!,
                                                        containerDopSoglachenieRow!
                                                            .nameCityDogovor!,
                                                        containerDopSoglachenieRow!
                                                            .createdAt,
                                                        containerDopSoglachenieRow!
                                                            .nameCompaniDogovor!,
                                                        containerDopSoglachenieRow!
                                                            .iINComany!,
                                                        containerDopSoglachenieRow!
                                                            .familiyaHozyaina!,
                                                        containerDopSoglachenieRow!
                                                            .imyaHoziaina!,
                                                        containerDopSoglachenieRow
                                                            ?.otchestvoHozyaina,
                                                        containerDopSoglachenieRow!
                                                            .dataClient!,
                                                        containerDopSoglachenieRow!
                                                            .iinClienta!,
                                                        containerDopSoglachenieRow!
                                                            .dateNachala!,
                                                        containerDopSoglachenieRow!
                                                            .dateOkonchaniya!,
                                                        containerDopSoglachenieRow!
                                                            .cenaSutki!
                                                            .toDouble(),
                                                        containerDopSoglachenieRow
                                                            ?.cenaViezd
                                                            ?.toDouble(),
                                                        containerDopSoglachenieRow!
                                                            .cenaItogo!
                                                            .toDouble(),
                                                        containerDopSoglachenieRow!
                                                            .adresRegistraciiCompanii!,
                                                        containerDopSoglachenieRow!
                                                            .adresPropiski!,
                                                        containerDopSoglachenieRow!
                                                            .adresProzhianiya!,
                                                        containerDopSoglachenieRow!
                                                            .nomerUdostovereniyaHozyaina!,
                                                        containerDopSoglachenieRow!
                                                            .nomerTelefona!,
                                                        dateTimeFormat(
                                                            "d MMM yyy",
                                                            containerDopSoglachenieRow!
                                                                .dateUdostovereniyaHoziyain!),
                                                        'МВД РК',
                                                        containerDopSoglachenieRow!
                                                            .dateUdostovereniya!,
                                                        containerDopSoglachenieRow!
                                                            .kemVydanoUdostovereniyaClient!,
                                                        containerDopSoglachenieRow!
                                                            .telefonHozyaina!,
                                                        containerDopSoglachenieRow!
                                                            .nomerTelefona!,
                                                        containerDopSoglachenieRow!
                                                            .iikCompony!,
                                                        containerDopSoglachenieRow!
                                                            .iINComany!,
                                                        containerDopSoglachenieRow!
                                                            .kbeCompany!,
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/clientpage-pd1zz7/assets/w3kma5sn4my1/логотип_копия.jpg',
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/clientpage-pd1zz7/assets/z3dcipif0veh/печать.png',
                                                        true,
                                                        containerDopSoglachenieRow
                                                            ?.codPodpisi,
                                                      );
                                                      _model.progres = 0.07;
                                                      safeSetState(() {});
                                                      _model.dSHashOut =
                                                          await actions
                                                              .calculatePDFHash(
                                                        _model.dsOut,
                                                      );
                                                      _model.progres = 0.14;
                                                      safeSetState(() {});
                                                      await DopSoglachenieTable()
                                                          .update(
                                                        data: {
                                                          'cod_podpisi': _model
                                                              .textController
                                                              .text,
                                                          'hash_dopsoglasheniya':
                                                              _model.dSHashOut,
                                                          'status_podpisi_clienta':
                                                              true,
                                                          'status': true,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id',
                                                          containerDopSoglachenieRow
                                                              ?.id,
                                                        ),
                                                      );
                                                      _model.progres = 0.21;
                                                      safeSetState(() {});
                                                      _model.ipOut =
                                                          await GetIPCall
                                                              .call();

                                                      _model.progres = 0.28;
                                                      safeSetState(() {});
                                                      _model.devaiceInfo =
                                                          await actions
                                                              .getDeviceInfo();
                                                      _model.progres = 0.35;
                                                      safeSetState(() {});
                                                      _model.trhnikalPageDSOut =
                                                          await actions
                                                              .mergeTechnicalPage(
                                                        _model.dsOut!,
                                                        'Дополнительное соглашение №  ${containerDopSoglachenieRow?.nomerDopSoglasheniya} к договору  ${containerDopSoglachenieRow?.nomerDogovora}  от  ${dateTimeFormat("d MMM y", containerDopSoglachenieRow?.dateDogovora)}',
                                                        containerDopSoglachenieRow!
                                                            .idDogovora!,
                                                        getJsonField(
                                                          (_model.ipOut
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.ip''',
                                                        ).toString(),
                                                        _model.devaiceInfo!,
                                                        _model.textController
                                                            .text,
                                                        containerDopSoglachenieRow!
                                                            .nameCompaniDogovor!,
                                                        containerDopSoglachenieRow!
                                                            .iINComany!,
                                                        containerDopSoglachenieRow!
                                                            .adresRegistraciiCompanii!,
                                                        containerDopSoglachenieRow!
                                                            .telefonHozyaina!,
                                                        containerDopSoglachenieRow!
                                                            .iikCompony!,
                                                        containerDopSoglachenieRow!
                                                            .bikCompani!,
                                                        containerDopSoglachenieRow!
                                                            .kbeCompany!,
                                                        containerDopSoglachenieRow!
                                                            .nomerUdostovereniyaHozyaina!,
                                                        containerDopSoglachenieRow!
                                                            .dateUdostovereniyaHoziyain!,
                                                        'МВД РК',
                                                        containerDopSoglachenieRow!
                                                            .familiyaHozyaina!,
                                                        containerDopSoglachenieRow!
                                                            .imyaHoziaina!,
                                                        containerDopSoglachenieRow
                                                            ?.otchestvoHozyaina,
                                                        containerDopSoglachenieRow!
                                                            .dataClient!,
                                                        '-',
                                                        '-',
                                                        containerDopSoglachenieRow
                                                            ?.iinClienta,
                                                        containerDopSoglachenieRow!
                                                            .udostoverenieClienta!,
                                                        containerDopSoglachenieRow
                                                            ?.dateUdostovereniya,
                                                        containerDopSoglachenieRow!
                                                            .kemVydanoUdostovereniyaClient!,
                                                        containerDopSoglachenieRow!
                                                            .nomerTelefona!,
                                                        containerDopSoglachenieRow!
                                                            .adresPropiski!,
                                                        containerDopSoglachenieRow
                                                            ?.adresProzhianiya,
                                                        containerDopSoglachenieRow
                                                            ?.emailKlient,
                                                      );
                                                      _model.progres = 0.42;
                                                      safeSetState(() {});
                                                      await DopSoglachenieTable()
                                                          .update(
                                                        data: {
                                                          'url_pasporta': _model
                                                              .trhnikalPageDSOut,
                                                          'url_dop_soglasheniya':
                                                              _model.dsOut,
                                                          'podpisan_dop_soglashenie':
                                                              true,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id',
                                                          containerDopSoglachenieRow
                                                              ?.id,
                                                        ),
                                                      );
                                                      _model.progres = 0.49;
                                                      safeSetState(() {});
                                                      _model.contractOut =
                                                          await ContractsTable()
                                                              .queryRows(
                                                        queryFn: (q) =>
                                                            q.eqOrNull(
                                                          'id',
                                                          containerDopSoglachenieRow
                                                              ?.idDogovora,
                                                        ),
                                                      );
                                                      await EzhednevkaTable()
                                                          .insert({
                                                        'created_at': supaSerialize<
                                                                DateTime>(
                                                            getCurrentTimestamp),
                                                        'id_company':
                                                            containerDopSoglachenieRow
                                                                ?.idCompanyDogovor,
                                                        'name_company':
                                                            containerDopSoglachenieRow
                                                                ?.nameCompaniDogovor,
                                                        'id_city_company':
                                                            containerDopSoglachenieRow
                                                                ?.idCityDogovor,
                                                        'city_company':
                                                            containerDopSoglachenieRow
                                                                ?.nameCityDogovor,
                                                        'id_manager':
                                                            containerDopSoglachenieRow
                                                                ?.idManager,
                                                        'manager_familiya':
                                                            containerDopSoglachenieRow
                                                                ?.dataManager,
                                                        'id_car':
                                                            containerDopSoglachenieRow
                                                                ?.idAvto,
                                                        'data_car':
                                                            '${containerDopSoglachenieRow?.modelAvto}  ${containerDopSoglachenieRow?.markaAvto}  ${containerDopSoglachenieRow?.gosNomerAvto}',
                                                        'id_client':
                                                            containerDopSoglachenieRow
                                                                ?.idClienta,
                                                        'data_client':
                                                            containerDopSoglachenieRow
                                                                ?.dataClient,
                                                        'numper_phone_klient':
                                                            containerDopSoglachenieRow
                                                                ?.nomerTelefona,
                                                        'date_nachala': supaSerialize<
                                                                DateTime>(
                                                            containerDopSoglachenieRow
                                                                ?.dateNachala),
                                                        'date_oconchaniya':
                                                            supaSerialize<
                                                                    DateTime>(
                                                                containerDopSoglachenieRow
                                                                    ?.dateOkonchaniya),
                                                        'kolichestvo_dnei':
                                                            containerDopSoglachenieRow
                                                                ?.kolichestvoDnei,
                                                        'cena_za_sutki':
                                                            containerDopSoglachenieRow
                                                                ?.cenaSutki,
                                                        'name_city':
                                                            containerDopSoglachenieRow
                                                                ?.cityViezd,
                                                        'stoimost_vyezda':
                                                            containerDopSoglachenieRow
                                                                ?.cenaViezd,
                                                        'cena_za_arendy':
                                                            containerDopSoglachenieRow
                                                                ?.cenaItogo,
                                                        'type_oplaty': false,
                                                        'number_dogovor':
                                                            'DS # ${containerDopSoglachenieRow?.nomerDopSoglasheniya} к ${containerDopSoglachenieRow?.nomerDogovora}',
                                                        'type': true,
                                                        'type_dogovor': false,
                                                        'id_contract':
                                                            containerDopSoglachenieRow
                                                                ?.idDogovora,
                                                      });
                                                      _model.progres = 0.56;
                                                      safeSetState(() {});
                                                      await BookingTable()
                                                          .insert({
                                                        'created_at': supaSerialize<
                                                                DateTime>(
                                                            getCurrentTimestamp),
                                                        'car_id':
                                                            containerDopSoglachenieRow
                                                                ?.idAvto,
                                                        'car_data':
                                                            '${containerDopSoglachenieRow?.modelAvto}  ${containerDopSoglachenieRow?.markaAvto}  ${containerDopSoglachenieRow?.gosNomerAvto}',
                                                        'klient_id':
                                                            containerDopSoglachenieRow
                                                                ?.idClienta,
                                                        'klient_data':
                                                            containerDopSoglachenieRow
                                                                ?.dataClient,
                                                        'start_date': supaSerialize<
                                                                DateTime>(
                                                            containerDopSoglachenieRow
                                                                ?.dateNachala),
                                                        'end_date': supaSerialize<
                                                                DateTime>(
                                                            containerDopSoglachenieRow
                                                                ?.dateOkonchaniya),
                                                        'status': 'paid',
                                                        'cena_sutki_so_skidkoi':
                                                            containerDopSoglachenieRow
                                                                ?.cenaSutki,
                                                        'kolvo_dneiy':
                                                            containerDopSoglachenieRow
                                                                ?.kolichestvoDnei,
                                                        'obshaya_summa':
                                                            containerDopSoglachenieRow
                                                                ?.cenaItogo,
                                                        'viezd_city':
                                                            containerDopSoglachenieRow
                                                                ?.cityViezd,
                                                        'cena_viezd':
                                                            containerDopSoglachenieRow
                                                                ?.cenaViezd,
                                                        'city_company':
                                                            containerDopSoglachenieRow
                                                                ?.nameCityDogovor,
                                                        'id_city_company':
                                                            containerDopSoglachenieRow
                                                                ?.idCityDogovor,
                                                        'type_dogovor': false,
                                                        'status_avto': true,
                                                        'company':
                                                            containerDopSoglachenieRow
                                                                ?.nameCompaniDogovor,
                                                        'id_company':
                                                            containerDopSoglachenieRow
                                                                ?.idCompanyDogovor,
                                                        'id_maneger':
                                                            containerDopSoglachenieRow
                                                                ?.idManager,
                                                        'role_manager':
                                                            containerDopSoglachenieRow
                                                                ?.managerRole,
                                                        'data_manager':
                                                            containerDopSoglachenieRow
                                                                ?.dataManager,
                                                        'idDogovor':
                                                            containerDopSoglachenieRow
                                                                ?.idDogovora,
                                                      });
                                                      _model.progres = 0.63;
                                                      safeSetState(() {});
                                                      await Future.delayed(
                                                        Duration(
                                                          milliseconds: 20,
                                                        ),
                                                      );
                                                      _model.progres = 0.7;
                                                      safeSetState(() {});
                                                      _model.podpis = '1';
                                                      safeSetState(() {});
                                                      _model.progres = 0.77;
                                                      safeSetState(() {});
                                                      _model.progres = 0.84;
                                                      safeSetState(() {});
                                                      await ContractsTable()
                                                          .insert({
                                                        'created_at': supaSerialize<
                                                                DateTime>(
                                                            getCurrentTimestamp),
                                                        'nomer_dogovora':
                                                            'DS-${containerDopSoglachenieRow?.nomerDopSoglasheniya} k ${containerDopSoglachenieRow?.nomerDogovora}',
                                                        'date_dogovora': supaSerialize<
                                                                DateTime>(
                                                            containerDopSoglachenieRow
                                                                ?.dateDopSoglasheniya),
                                                        'marka_avto': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.markaAvto,
                                                        'model_avto': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.modelAvto,
                                                        'gos_nomer': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.gosNomer,
                                                        'city_dogovor':
                                                            containerDopSoglachenieRow
                                                                ?.nameCityDogovor,
                                                        'vin_code': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.vinCode,
                                                        'god_vypuska': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.godVypuska,
                                                        'cvet_avto': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.cvetAvto,
                                                        'toplivo': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.cvetAvto,
                                                        'stoimost_avto': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.stoimostAvto,
                                                        'cena_sutci':
                                                            containerDopSoglachenieRow
                                                                ?.cenaSutki,
                                                        'company_name':
                                                            containerDopSoglachenieRow
                                                                ?.nameCompaniDogovor,
                                                        'compani_id':
                                                            containerDopSoglachenieRow
                                                                ?.idCompanyDogovor,
                                                        'familiya_hozyain': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.familiyaHozyain,
                                                        'imya_hozyain': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.imyaHozyain,
                                                        'otchestvo_hozyain': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.otchestvoHozyain,
                                                        'iin_hozyain': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.iinHozyain,
                                                        'telephone_hozyan': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.telephoneHozyan,
                                                        'adres_company': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.adresCompany,
                                                        'udostoverenie_number': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.udostoverenieNumber,
                                                        'date_vydachi_udostovereniya':
                                                            supaSerialize<
                                                                    DateTime>(
                                                                _model
                                                                    .contractOut
                                                                    ?.elementAtOrNull(
                                                                        0)
                                                                    ?.dateVydachiUdostovereniya),
                                                        'kem_vydan': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.kemVydan,
                                                        'iik': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.iik,
                                                        'bik': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.bik,
                                                        'kbe': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.kbe,
                                                        'id_client': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.idClient,
                                                        'client_familiya': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.clientFamiliya,
                                                        'client_imya': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.clientImya,
                                                        'client_otchestvo': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.clientOtchestvo,
                                                        'client_iin': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.clientIin,
                                                        'client_adrs_propiki': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.clientAdrsPropiki,
                                                        'client_dres_prozhivaniya':
                                                            _model.contractOut
                                                                ?.elementAtOrNull(
                                                                    0)
                                                                ?.clientDresProzhivaniya,
                                                        'client_nomer_udostoverebiya':
                                                            _model.contractOut
                                                                ?.elementAtOrNull(
                                                                    0)
                                                                ?.clientNomerUdostoverebiya,
                                                        'client_date_vydachi':
                                                            supaSerialize<
                                                                    DateTime>(
                                                                _model
                                                                    .contractOut
                                                                    ?.elementAtOrNull(
                                                                        0)
                                                                    ?.clientDateVydachi),
                                                        'client_kem_vydan': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.clientKemVydan,
                                                        'client_pfone': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.clientPfone,
                                                        'date_nachala_arendy':
                                                            supaSerialize<
                                                                    DateTime>(
                                                                containerDopSoglachenieRow
                                                                    ?.dateNachala),
                                                        'date_okonchaniya_arendy':
                                                            supaSerialize<
                                                                    DateTime>(
                                                                containerDopSoglachenieRow
                                                                    ?.dateOkonchaniya),
                                                        'colichestvo_dnei':
                                                            containerDopSoglachenieRow
                                                                ?.kolichestvoDnei,
                                                        'vyezd':
                                                            containerDopSoglachenieRow
                                                                ?.vyezd,
                                                        'vyezd_city':
                                                            containerDopSoglachenieRow
                                                                ?.cityViezd,
                                                        'vyezd_cena':
                                                            containerDopSoglachenieRow
                                                                ?.cenaViezd,
                                                        'depozit_kassa': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.depozitKassa,
                                                        'car_id': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.carId,
                                                        'nalichka': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.nalichka,
                                                        'car_hozyain_id': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.carHozyainId,
                                                        'car_cena_sutki_skidka':
                                                            containerDopSoglachenieRow
                                                                ?.cenaSutki,
                                                        'stoimost_arendy':
                                                            containerDopSoglachenieRow
                                                                ?.cenaItogo,
                                                        'stoimost_arendy_bez_depozita':
                                                            containerDopSoglachenieRow
                                                                ?.cenaItogo,
                                                        'dogovor_url': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.dogovorUrl,
                                                        'dogovor_code': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.dogovorCode,
                                                        'imuchestvo': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.imuchestvo,
                                                        'act_priema_url': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.actPriemaUrl,
                                                        'act_priema_code': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.actPriemaCode,
                                                        'soglasie_na_straf_url':
                                                            _model.contractOut
                                                                ?.elementAtOrNull(
                                                                    0)
                                                                ?.soglasieNaStrafUrl,
                                                        'soglasie_na_shtraf_code':
                                                            _model.contractOut
                                                                ?.elementAtOrNull(
                                                                    0)
                                                                ?.soglasieNaShtrafCode,
                                                        'putevoi_list_url':
                                                            containerDopSoglachenieRow
                                                                ?.putevoiList,
                                                        'avtor_familiya':
                                                            containerDopSoglachenieRow
                                                                ?.dataManager,
                                                        'status_dogovora': true,
                                                        'vid_dogovora': false,
                                                        'hash_contract': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.hashContract,
                                                        'hach_act': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.hachAct,
                                                        'hash_soglasie': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.hashSoglasie,
                                                        'tehnical_list_contract':
                                                            _model.contractOut
                                                                ?.elementAtOrNull(
                                                                    0)
                                                                ?.tehnicalListContract,
                                                        'nomer_talona': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.nomerTalona,
                                                        'date_vydachi_talona':
                                                            supaSerialize<
                                                                    DateTime>(
                                                                _model
                                                                    .contractOut
                                                                    ?.elementAtOrNull(
                                                                        0)
                                                                    ?.dateVydachiTalona),
                                                        'client_email': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.clientEmail,
                                                        'company_bank': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.companyBank,
                                                        'probeg': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.probeg,
                                                        'tehnical_list_akt': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.tehnicalListAkt,
                                                        'tehnikal_list_sogasie':
                                                            _model.contractOut
                                                                ?.elementAtOrNull(
                                                                    0)
                                                                ?.tehnikalListSogasie,
                                                        'city_id':
                                                            containerDopSoglachenieRow
                                                                ?.idCityDogovor,
                                                        'raspechatat': _model
                                                            .contractOut
                                                            ?.elementAtOrNull(0)
                                                            ?.raspechatat,
                                                        'pechat':
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/ronat-admin-ecwuw2/assets/vbfd7rgrv8z6/печать.png',
                                                        'id_manager':
                                                            containerDopSoglachenieRow
                                                                ?.idManager,
                                                        'data_manager':
                                                            containerDopSoglachenieRow
                                                                ?.dataManager,
                                                        'role_avtor':
                                                            containerDopSoglachenieRow
                                                                ?.managerRole,
                                                        'DS': true,
                                                        'id_contract':
                                                            containerDopSoglachenieRow
                                                                ?.idDogovora,
                                                        'ds_url': _model.dsOut,
                                                        'tpi_ds_url': _model
                                                            .trhnikalPageDSOut,
                                                      });
                                                      _model.progres = 0.91;
                                                      safeSetState(() {});
                                                      FFAppState()
                                                          .dopSoglashenie = '1';
                                                      safeSetState(() {});
                                                      _model.progres = 0.98;
                                                      safeSetState(() {});

                                                      context.pushNamed(
                                                        DopWidget.routeName,
                                                        queryParameters: {
                                                          'id': serializeParam(
                                                            widget!.id,
                                                            ParamType.String,
                                                          ),
                                                          'typ': serializeParam(
                                                            widget!.type,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      safeSetState(() {});
                                                    },
                                                    text: 'ПОДПИСАТЬ',
                                                    options: FFButtonOptions(
                                                      width: 250.0,
                                                      height: 30.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFF04FBDE),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .interTight(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                if (_model.code !=
                                                    containerDopSoglachenieRow
                                                        ?.codPodpisi)
                                                  FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    text: 'ПОДПИСАТЬ',
                                                    options: FFButtonOptions(
                                                      width: 250.0,
                                                      height: 30.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .interTight(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 5.0, 10.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      LinearPercentIndicator(
                                                        percent:
                                                            _model.progres!,
                                                        width: 300.0,
                                                        lineHeight: 12.0,
                                                        animation: true,
                                                        animateFromLastPercent:
                                                            true,
                                                        progressColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                        barRadius:
                                                            Radius.circular(
                                                                8.0),
                                                        padding:
                                                            EdgeInsets.zero,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (_model.podpis == '1')
                                          FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: 'Документ подписан',
                                            options: FFButtonOptions(
                                              width: 250.0,
                                              height: 30.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
