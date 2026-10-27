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
import 'subarenda_model.dart';
export 'subarenda_model.dart';

class SubarendaWidget extends StatefulWidget {
  const SubarendaWidget({
    super.key,
    required this.id,
    this.type,
  });

  final String? id;
  final String? type;

  static String routeName = 'subarenda';
  static String routePath = '/subarenda';

  @override
  State<SubarendaWidget> createState() => _SubarendaWidgetState();
}

class _SubarendaWidgetState extends State<SubarendaWidget> {
  late SubarendaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubarendaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.subarendaOut = await DogovorSubarendyTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget!.id,
        ),
      );
      _model.podpisat = '0';
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<DogovorSubarendyRow>>(
            future: DogovorSubarendyTable().querySingleRow(
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
              List<DogovorSubarendyRow> containerDogovorSubarendyRowList =
                  snapshot.data!;

              final containerDogovorSubarendyRow =
                  containerDogovorSubarendyRowList.isNotEmpty
                      ? containerDogovorSubarendyRowList.first
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
                                    'ДОГОВОР СУБАРЕНДЫ',
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
                                    networkPath: containerDogovorSubarendyRow!
                                        .dogovorUrl!,
                                    height: 268.9,
                                    horizontalScroll: false,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 20.0),
                                child: Container(
                                  height: 201.4,
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
                                              valueOrDefault<String>(
                                                'код для подписи - ${_model.subarendaOut?.elementAtOrNull(0)?.dogovorSubarendyCod}',
                                                'код подписи',
                                              ),
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
                                              'Введя код вы подписываете договор субаренды и подтверждаете безусловное согласие с условиями договора',
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
                                                    containerDogovorSubarendyRow
                                                        ?.dogovorSubarendyCod)
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await DogovorSubarendyTable()
                                                          .update(
                                                        data: {
                                                          'created_at':
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
                                                      _model.progres = 0.1;
                                                      safeSetState(() {});
                                                      _model.soglasieOut =
                                                          await actions
                                                              .generateSubleaseContract(
                                                        containerDogovorSubarendyRow!
                                                            .dataReg!,
                                                        containerDogovorSubarendyRow!
                                                            .dataOkonchaniya!,
                                                        containerDogovorSubarendyRow!
                                                            .logotipUrl!,
                                                        containerDogovorSubarendyRow!
                                                            .prchatUrl!,
                                                        containerDogovorSubarendyRow
                                                            ?.dogovorSubarendyCod,
                                                        containerDogovorSubarendyRow!
                                                            .raspechatat!,
                                                        true,
                                                        containerDogovorSubarendyRow!
                                                            .ficsa!,
                                                        '${containerDogovorSubarendyRow?.partFamiliya} ${containerDogovorSubarendyRow?.partImya} ${containerDogovorSubarendyRow?.partOtchestvo}',
                                                        containerDogovorSubarendyRow!
                                                            .partIin!,
                                                        containerDogovorSubarendyRow!
                                                            .partNomerDoc!,
                                                        containerDogovorSubarendyRow!
                                                            .partKemVydan!,
                                                        dateTimeFormat(
                                                            "d MMM yyy",
                                                            containerDogovorSubarendyRow!
                                                                .partKogdaVydan!),
                                                        containerDogovorSubarendyRow!
                                                            .partTelefone!,
                                                        containerDogovorSubarendyRow!
                                                            .companiName!,
                                                        '${containerDogovorSubarendyRow?.dirFamiliya} ${containerDogovorSubarendyRow?.dirImya} ${containerDogovorSubarendyRow?.dirOtchestvo}',
                                                        containerDogovorSubarendyRow!
                                                            .dirIin!,
                                                        containerDogovorSubarendyRow!
                                                            .dirNomberDoc!,
                                                        containerDogovorSubarendyRow!
                                                            .dirKemVydan!,
                                                        dateTimeFormat(
                                                            "d MMM yyy",
                                                            containerDogovorSubarendyRow!
                                                                .dirKogdaVydan!),
                                                        containerDogovorSubarendyRow!
                                                            .avtoMarka!,
                                                        containerDogovorSubarendyRow!
                                                            .avtoModel!,
                                                        containerDogovorSubarendyRow!
                                                            .avtoGosNomer!,
                                                        containerDogovorSubarendyRow!
                                                            .avtoVin!,
                                                        containerDogovorSubarendyRow!
                                                            .avtoGodVypuska!,
                                                        containerDogovorSubarendyRow!
                                                            .avtoCvet!,
                                                        containerDogovorSubarendyRow!
                                                            .avtoTehPasport!,
                                                        containerDogovorSubarendyRow!
                                                            .avtoToplivo!,
                                                        containerDogovorSubarendyRow!
                                                            .oplataProc!,
                                                        containerDogovorSubarendyRow!
                                                            .oplataFics!,
                                                        containerDogovorSubarendyRow!
                                                            .avtoCena!,
                                                      );
                                                      _model.progres = 0.2;
                                                      safeSetState(() {});
                                                      _model.hashOut =
                                                          await actions
                                                              .calculatePDFHash(
                                                        _model.soglasieOut,
                                                      );
                                                      _model.progres = 0.3;
                                                      safeSetState(() {});
                                                      await DogovorSubarendyTable()
                                                          .update(
                                                        data: {
                                                          'dogovor_url': _model
                                                              .soglasieOut,
                                                          'huch_soglasie':
                                                              _model.hashOut,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id',
                                                          containerDogovorSubarendyRow
                                                              ?.id,
                                                        ),
                                                      );
                                                      _model.progres = 0.4;
                                                      safeSetState(() {});
                                                      _model.deviceInfoOut =
                                                          await actions
                                                              .getDeviceInfo();
                                                      _model.progres = 0.5;
                                                      safeSetState(() {});
                                                      _model.ipOut =
                                                          await GetIPCall
                                                              .call();

                                                      _model.progres = 0.6;
                                                      safeSetState(() {});
                                                      _model.companiOut =
                                                          await KompaniyaTable()
                                                              .queryRows(
                                                        queryFn: (q) =>
                                                            q.eqOrNull(
                                                          'id',
                                                          containerDogovorSubarendyRow
                                                              ?.companyId,
                                                        ),
                                                      );
                                                      _model.progres = 0.7;
                                                      safeSetState(() {});
                                                      _model.tehnicalListOut =
                                                          await actions
                                                              .mergeTechnicalPage(
                                                        _model.soglasieOut!,
                                                        'Договор субаренды ${containerDogovorSubarendyRow?.avtoMarka} ${containerDogovorSubarendyRow?.avtoModel} ${containerDogovorSubarendyRow?.avtoGosNomer} от ${dateTimeFormat("d MMM yyy г.", containerDogovorSubarendyRow?.dataReg)}',
                                                        widget!.id!,
                                                        getJsonField(
                                                          (_model.ipOut
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.ip''',
                                                        ).toString(),
                                                        _model.deviceInfoOut!,
                                                        containerDogovorSubarendyRow
                                                            ?.dogovorSubarendyCod,
                                                        containerDogovorSubarendyRow!
                                                            .companiName!,
                                                        _model.companiOut!
                                                            .elementAtOrNull(0)!
                                                            .iinBin!,
                                                        _model.companiOut!
                                                            .elementAtOrNull(0)!
                                                            .adresCompany!,
                                                        _model.companiOut!
                                                            .elementAtOrNull(0)!
                                                            .telephone!,
                                                        _model.companiOut!
                                                            .elementAtOrNull(0)!
                                                            .iik!,
                                                        _model.companiOut!
                                                            .elementAtOrNull(0)!
                                                            .bik!,
                                                        _model.companiOut!
                                                            .elementAtOrNull(0)!
                                                            .kbe!,
                                                        _model.companiOut!
                                                            .elementAtOrNull(0)!
                                                            .numberDoc!,
                                                        _model.companiOut!
                                                            .elementAtOrNull(0)!
                                                            .kogdaVydan!,
                                                        _model.companiOut!
                                                            .elementAtOrNull(0)!
                                                            .kemVydan!,
                                                        containerDogovorSubarendyRow!
                                                            .dirFamiliya!,
                                                        containerDogovorSubarendyRow!
                                                            .companiName!,
                                                        containerDogovorSubarendyRow
                                                            ?.dirOtchestvo,
                                                        containerDogovorSubarendyRow!
                                                            .partFamiliya!,
                                                        containerDogovorSubarendyRow!
                                                            .partImya!,
                                                        containerDogovorSubarendyRow
                                                            ?.partOtchestvo,
                                                        containerDogovorSubarendyRow
                                                            ?.partIin,
                                                        containerDogovorSubarendyRow!
                                                            .partNomerDoc!,
                                                        containerDogovorSubarendyRow
                                                            ?.dirKogdaVydan,
                                                        containerDogovorSubarendyRow!
                                                            .partKemVydan!,
                                                        containerDogovorSubarendyRow!
                                                            .partTelefone!,
                                                        '-',
                                                        '-',
                                                        '-',
                                                      );
                                                      _model.progres = 0.8;
                                                      safeSetState(() {});
                                                      await DogovorSubarendyTable()
                                                          .update(
                                                        data: {
                                                          'tpi_dogovor_subarendy':
                                                              _model
                                                                  .tehnicalListOut,
                                                          'viewed_dogovor':
                                                              true,
                                                          'ip_devaice':
                                                              getJsonField(
                                                            (_model.ipOut
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.ip''',
                                                          ).toString(),
                                                          'devaice_info': _model
                                                              .deviceInfoOut,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id',
                                                          widget!.id,
                                                        ),
                                                      );
                                                      _model.progres = 0.9;
                                                      safeSetState(() {});
                                                      _model.podpisat = '1';
                                                      safeSetState(() {});
                                                      await CarsTable().update(
                                                        data: {
                                                          'date_start_dogovor':
                                                              supaSerialize<
                                                                      DateTime>(
                                                                  _model
                                                                      .subarendaOut
                                                                      ?.elementAtOrNull(
                                                                          0)
                                                                      ?.dataReg),
                                                          'date_end_dogovor':
                                                              supaSerialize<
                                                                      DateTime>(
                                                                  _model
                                                                      .subarendaOut
                                                                      ?.elementAtOrNull(
                                                                          0)
                                                                      ?.dataOkonchaniya),
                                                          'dogovor_subarendy_url':
                                                              _model
                                                                  .soglasieOut,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id',
                                                          containerDogovorSubarendyRow
                                                              ?.avtoId,
                                                        ),
                                                      );
                                                      _model.progres = 1.0;
                                                      safeSetState(() {});

                                                      context.pushNamed(
                                                        SubarendaPageWidget
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
                                                      color: Color(0xFF05F9C6),
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
                                                    containerDogovorSubarendyRow
                                                        ?.dogovorSubarendyCod)
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
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    5.0,
                                                                    10.0,
                                                                    10.0),
                                                        child:
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
                                                                  6.0),
                                                          padding:
                                                              EdgeInsets.zero,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
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
                                              text: 'Договор подписан',
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
                                                color: Color(0xFF1900FB),
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
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
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
