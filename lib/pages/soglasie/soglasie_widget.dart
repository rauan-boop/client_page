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
import 'soglasie_model.dart';
export 'soglasie_model.dart';

class SoglasieWidget extends StatefulWidget {
  const SoglasieWidget({
    super.key,
    required this.id,
    this.type,
  });

  final String? id;
  final String? type;

  static String routeName = 'soglasie';
  static String routePath = '/soglasie';

  @override
  State<SoglasieWidget> createState() => _SoglasieWidgetState();
}

class _SoglasieWidgetState extends State<SoglasieWidget> {
  late SoglasieModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SoglasieModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.podpisat = '0';
      _model.process = 0.01;
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<ContractsRow>>(
            future: ContractsTable().querySingleRow(
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
              List<ContractsRow> containerContractsRowList = snapshot.data!;

              final containerContractsRow = containerContractsRowList.isNotEmpty
                  ? containerContractsRowList.first
                  : null;

              return Container(
                width: double.infinity,
                height: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 400.0,
                  maxHeight: 900.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.9,
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'СОГЛАСИЕ НА ПЕРЕВОД\nПОЛУЧЕННЫХ ШТРАФОВ',
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
                                          color: Color(0xFF090909),
                                          fontSize: 14.0,
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
                                    networkPath: containerContractsRow!
                                        .soglasieNaStrafUrl!,
                                    height: 268.9,
                                    horizontalScroll: false,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 20.0),
                                child: Container(
                                  height: 200.0,
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
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 5.0),
                                            child: Text(
                                              'код для подписи - ${containerContractsRow?.soglasieNaShtrafCode}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 10.0),
                                            child: Text(
                                              'Введя код вы подписываете согласие на перевод полученных штрафов и подтверждаете безусловное согласие с условиями',
                                              textAlign: TextAlign.center,
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
                                                      fontSize: 12.0,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
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
                                        if (_model.podpisat == '0')
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (_model.code ==
                                                    containerContractsRow
                                                        ?.soglasieNaShtrafCode)
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await ContractsTable()
                                                          .update(
                                                        data: {
                                                          'soglasie_na_shtraf_code':
                                                              _model
                                                                  .textController
                                                                  .text,
                                                          'soglasie_podpisano':
                                                              supaSerialize<
                                                                      DateTime>(
                                                                  getCurrentTimestamp),
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id',
                                                          widget!.id,
                                                        ),
                                                      );
                                                      _model.process = 0.1;
                                                      safeSetState(() {});
                                                      _model.soglasieOut =
                                                          await actions
                                                              .soglasieNaShtraf(
                                                        containerContractsRow!
                                                            .nomerDogovora!,
                                                        containerContractsRow!
                                                            .dateDogovora!,
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/clientpage-pd1zz7/assets/w3kma5sn4my1/логотип_копия.jpg',
                                                        containerContractsRow
                                                            ?.soglasieNaShtrafCode,
                                                        containerContractsRow!
                                                            .companyName!,
                                                        containerContractsRow!
                                                            .iinHozyain!,
                                                        containerContractsRow!
                                                            .familiyaHozyain!,
                                                        containerContractsRow!
                                                            .imyaHozyain!,
                                                        containerContractsRow
                                                            ?.otchestvoHozyain,
                                                        '${containerContractsRow?.clientFamiliya}  ${containerContractsRow?.clientImya}  ${containerContractsRow?.clientOtchestvo}',
                                                        containerContractsRow!
                                                            .clientIin!,
                                                        containerContractsRow!
                                                            .markaAvto!,
                                                        containerContractsRow!
                                                            .modelAvto!,
                                                        containerContractsRow!
                                                            .gosNomer!,
                                                        containerContractsRow!
                                                            .clientPfone!,
                                                        containerContractsRow!
                                                            .dateNachalaArendy!,
                                                        containerContractsRow!
                                                            .dateOkonchaniyaArendy!,
                                                        false,
                                                        true,
                                                      );
                                                      _model.process = 0.2;
                                                      safeSetState(() {});
                                                      _model.hashOut =
                                                          await actions
                                                              .calculatePDFHash(
                                                        _model.soglasieOut,
                                                      );
                                                      _model.process = 0.3;
                                                      safeSetState(() {});
                                                      await ContractsTable()
                                                          .update(
                                                        data: {
                                                          'soglasie_na_straf_url':
                                                              _model
                                                                  .soglasieOut,
                                                          'hash_soglasie':
                                                              _model.hashOut,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id',
                                                          widget!.id,
                                                        ),
                                                      );
                                                      _model.process = 0.4;
                                                      safeSetState(() {});
                                                      _model.deviceInfoOut =
                                                          await actions
                                                              .getDeviceInfo();
                                                      _model.process = 0.5;
                                                      safeSetState(() {});
                                                      _model.ipOut =
                                                          await GetIPCall
                                                              .call();

                                                      _model.process = 0.6;
                                                      safeSetState(() {});
                                                      _model.tehnicalListOut =
                                                          await actions
                                                              .mergeTechnicalPage(
                                                        _model.soglasieOut!,
                                                        'Согласие на перевод штрафов. Приложение № 2 к договору аренды легкового автомобиля №  ${containerContractsRow?.nomerDogovora}  от  ${dateTimeFormat("d MMM y", containerContractsRow?.dateDogovora)}  г.',
                                                        widget!.id!,
                                                        getJsonField(
                                                          (_model.ipOut
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.ip''',
                                                        ).toString(),
                                                        _model.deviceInfoOut!,
                                                        containerContractsRow
                                                            ?.soglasieNaShtrafCode,
                                                        containerContractsRow!
                                                            .companyName!,
                                                        containerContractsRow!
                                                            .iinHozyain!,
                                                        containerContractsRow!
                                                            .adresCompany!,
                                                        containerContractsRow!
                                                            .telephoneHozyan!,
                                                        containerContractsRow!
                                                            .iik!,
                                                        containerContractsRow!
                                                            .bik!,
                                                        containerContractsRow!
                                                            .kbe!,
                                                        containerContractsRow!
                                                            .udostoverenieNumber!,
                                                        containerContractsRow!
                                                            .dateVydachiUdostovereniya!,
                                                        containerContractsRow!
                                                            .kemVydan!,
                                                        containerContractsRow!
                                                            .familiyaHozyain!,
                                                        containerContractsRow!
                                                            .imyaHozyain!,
                                                        containerContractsRow
                                                            ?.otchestvoHozyain,
                                                        containerContractsRow!
                                                            .clientFamiliya!,
                                                        containerContractsRow!
                                                            .clientImya!,
                                                        containerContractsRow
                                                            ?.clientOtchestvo,
                                                        containerContractsRow
                                                            ?.clientIin,
                                                        containerContractsRow!
                                                            .clientNomerUdostoverebiya!,
                                                        containerContractsRow
                                                            ?.clientDateVydachi,
                                                        containerContractsRow!
                                                            .clientKemVydan!,
                                                        containerContractsRow!
                                                            .clientPfone!,
                                                        containerContractsRow!
                                                            .clientAdrsPropiki!,
                                                        containerContractsRow
                                                            ?.clientDresProzhivaniya,
                                                        containerContractsRow
                                                            ?.clientEmail,
                                                      );
                                                      _model.process = 0.7;
                                                      safeSetState(() {});
                                                      await ContractsTable()
                                                          .update(
                                                        data: {
                                                          'tehnikal_list_sogasie':
                                                              _model
                                                                  .tehnicalListOut,
                                                          'viewed_soglasie':
                                                              true,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id',
                                                          widget!.id,
                                                        ),
                                                      );
                                                      _model.process = 0.8;
                                                      safeSetState(() {});
                                                      FFAppState().soglasie =
                                                          '1';
                                                      safeSetState(() {});
                                                      _model.process = 0.9;
                                                      safeSetState(() {});
                                                      _model.podpisat = '1';
                                                      safeSetState(() {});
                                                      _model.process = 1.0;
                                                      safeSetState(() {});

                                                      context.pushNamed(
                                                        GlavnayaStranicaWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'id': serializeParam(
                                                            widget!.id,
                                                            ParamType.String,
                                                          ),
                                                          'type':
                                                              serializeParam(
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
                                                      color: Color(0xFF03F9C5),
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
                                                                color: Colors
                                                                    .black,
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
                                                    containerContractsRow
                                                        ?.soglasieNaShtrafCode)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: FFButtonWidget(
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
                                                                  color: Colors
                                                                      .white,
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
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
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
                                                            _model.process!,
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
                                        if (_model.podpisat == '1')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              text: 'Согласие подписано',
                                              options: FFButtonOptions(
                                                width: 250.0,
                                                height: 30.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFF1C04FB),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
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
                                                          color: Colors.white,
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
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
