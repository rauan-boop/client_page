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
import 'contract_model.dart';
export 'contract_model.dart';

class ContractWidget extends StatefulWidget {
  const ContractWidget({
    super.key,
    required this.id,
    this.type,
  });

  final String? id;
  final String? type;

  static String routeName = 'contract';
  static String routePath = '/contract';

  @override
  State<ContractWidget> createState() => _ContractWidgetState();
}

class _ContractWidgetState extends State<ContractWidget> {
  late ContractModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContractModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.podpisat = '0';
      _model.progress = 0.01;
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
    context.watch<FFAppState>();

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
                                    'ДОГОВОР АРЕНДЫ',
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
                                    networkPath:
                                        containerContractsRow!.dogovorUrl!,
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
                                                'код для подписи - ${containerContractsRow?.dogovorCode}',
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
                                              'Введя код вы подписываете договор аренды и подтверждаете безусловное согласие с условиями договора',
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
                                                        ?.dogovorCode)
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await ContractsTable()
                                                          .update(
                                                        data: {
                                                          'dogovor_code': _model
                                                              .textController
                                                              .text,
                                                          'dogovor_podpisan':
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
                                                      _model.progress = 0.07;
                                                      safeSetState(() {});
                                                      _model.contractOut =
                                                          await actions
                                                              .generateContractLocal(
                                                        FFAppState()
                                                            .agreementText,
                                                        'dogovor_arendy_#_${containerContractsRow?.nomerDogovora}_${dateTimeFormat("d MMM y", containerContractsRow?.createdAt)}',
                                                        containerContractsRow!
                                                            .nomerDogovora!,
                                                        containerContractsRow!
                                                            .createdAt,
                                                        containerContractsRow!
                                                            .cityDogovor!,
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/clientpage-pd1zz7/assets/w3kma5sn4my1/логотип_копия.jpg',
                                                        containerContractsRow
                                                            ?.dogovorCode,
                                                        containerContractsRow!
                                                            .companyName!,
                                                        containerContractsRow!
                                                            .iinHozyain!,
                                                        containerContractsRow!
                                                            .adresCompany!,
                                                        containerContractsRow!
                                                            .telephoneHozyan!,
                                                        containerContractsRow!
                                                            .familiyaHozyain!,
                                                        containerContractsRow!
                                                            .imyaHozyain!,
                                                        containerContractsRow
                                                            ?.otchestvoHozyain,
                                                        containerContractsRow!
                                                            .nomerTalona!,
                                                        containerContractsRow
                                                            ?.dateVydachiTalona,
                                                        containerContractsRow!
                                                            .companyBank!,
                                                        containerContractsRow!
                                                            .iik!,
                                                        containerContractsRow!
                                                            .bik!,
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
                                                            .clientDresProzhivaniya!,
                                                        containerContractsRow
                                                            ?.clientAdrsPropiki,
                                                        containerContractsRow
                                                            ?.vyhodnoyi,
                                                        containerContractsRow
                                                            ?.depozitCardoo,
                                                        containerContractsRow!
                                                            .dateNachalaArendy!,
                                                        containerContractsRow!
                                                            .dateOkonchaniyaArendy!,
                                                        containerContractsRow
                                                                    ?.cardoo ==
                                                                true
                                                            ? containerContractsRow!
                                                                .stoimostArendy!
                                                            : containerContractsRow!
                                                                .stoimostArendyBezDepozita!,
                                                        containerContractsRow!
                                                            .carCenaSutkiSkidka!,
                                                        containerContractsRow
                                                            ?.depozitKassa,
                                                        containerContractsRow!
                                                            .toplivo!,
                                                        containerContractsRow!
                                                            .kbe!,
                                                        containerContractsRow!
                                                            .udostoverenieNumber!,
                                                        containerContractsRow!
                                                            .dateVydachiUdostovereniya!,
                                                        containerContractsRow!
                                                            .kemVydan!,
                                                        containerContractsRow!
                                                            .clientKemVydan!,
                                                        containerContractsRow!
                                                            .clientEmail!,
                                                        containerContractsRow
                                                            ?.vyezdCena,
                                                        containerContractsRow
                                                            ?.cardooCena,
                                                        containerContractsRow!
                                                            .raspechatat!,
                                                        containerContractsRow!
                                                            .pechat!,
                                                        () {
                                                          if (containerContractsRow
                                                                  ?.vidDogovora ==
                                                              true) {
                                                            return FFAppState()
                                                                .punkt3upravlencheski;
                                                          } else if ((containerContractsRow
                                                                      ?.vidDogovora ==
                                                                  false) &&
                                                              (containerContractsRow
                                                                      ?.cardoo ==
                                                                  true)) {
                                                            return FFAppState()
                                                                .punkt31cardoo;
                                                          } else {
                                                            return FFAppState()
                                                                .punkt3oficial;
                                                          }
                                                        }(),
                                                        containerContractsRow
                                                                    ?.cardoo ==
                                                                false
                                                            ? FFAppState()
                                                                .pubkt33oficial
                                                            : FFAppState()
                                                                .punkt36doodocs,
                                                        true,
                                                      );
                                                      _model.progress = 0.14;
                                                      safeSetState(() {});
                                                      _model.hashOut =
                                                          await actions
                                                              .calculatePDFHash(
                                                        _model.contractOut,
                                                      );
                                                      _model.progress = 0.21;
                                                      safeSetState(() {});
                                                      await ContractsTable()
                                                          .update(
                                                        data: {
                                                          'dogovor_url': _model
                                                              .contractOut,
                                                          'hash_contract':
                                                              _model.hashOut,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id',
                                                          widget!.id,
                                                        ),
                                                      );
                                                      _model.progress = 0.28;
                                                      safeSetState(() {});
                                                      _model.deviceInfoOut =
                                                          await actions
                                                              .getDeviceInfo();
                                                      _model.progress = 0.35;
                                                      safeSetState(() {});
                                                      _model.ipOut =
                                                          await GetIPCall
                                                              .call();

                                                      _model.progress = 0.42;
                                                      safeSetState(() {});
                                                      _model.tehnicalListOut =
                                                          await actions
                                                              .mergeTechnicalPage(
                                                        _model.contractOut!,
                                                        'Договор аренды легкового автомобиля №  ${containerContractsRow?.nomerDogovora} от  ${dateTimeFormat("d MMM y", containerContractsRow?.createdAt)}  г.',
                                                        widget!.id!,
                                                        getJsonField(
                                                          (_model.ipOut
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.ip''',
                                                        ).toString(),
                                                        _model.deviceInfoOut!,
                                                        containerContractsRow
                                                            ?.dogovorCode,
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
                                                      _model.progress = 0.49;
                                                      safeSetState(() {});
                                                      await ContractsTable()
                                                          .update(
                                                        data: {
                                                          'tehnical_list_contract':
                                                              _model
                                                                  .tehnicalListOut,
                                                          'viewed_dogovor':
                                                              true,
                                                          'ip_ustroistva':
                                                              getJsonField(
                                                            (_model.ipOut
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.ip''',
                                                          ).toString(),
                                                          'device_info': _model
                                                              .deviceInfoOut,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id',
                                                          widget!.id,
                                                        ),
                                                      );
                                                      _model.progress = 0.56;
                                                      safeSetState(() {});
                                                      await EzhednevkaTable()
                                                          .insert({
                                                        'created_at': supaSerialize<
                                                                DateTime>(
                                                            getCurrentTimestamp),
                                                        'id_company':
                                                            containerContractsRow
                                                                ?.companiId,
                                                        'name_company':
                                                            containerContractsRow
                                                                ?.companyName,
                                                        'id_city_company':
                                                            containerContractsRow
                                                                ?.cityId,
                                                        'city_company':
                                                            containerContractsRow
                                                                ?.cityDogovor,
                                                        'id_manager':
                                                            containerContractsRow
                                                                ?.idManager,
                                                        'manager_familiya':
                                                            containerContractsRow
                                                                ?.dataManager,
                                                        'id_car':
                                                            containerContractsRow
                                                                ?.carId,
                                                        'data_car':
                                                            '${containerContractsRow?.markaAvto}  ${containerContractsRow?.modelAvto}  ${containerContractsRow?.gosNomer}',
                                                        'id_client':
                                                            containerContractsRow
                                                                ?.idClient,
                                                        'data_client':
                                                            '${containerContractsRow?.clientFamiliya}  ${containerContractsRow?.clientImya}  ${containerContractsRow?.clientOtchestvo}',
                                                        'numper_phone_klient':
                                                            containerContractsRow
                                                                ?.clientPfone,
                                                        'date_nachala': supaSerialize<
                                                                DateTime>(
                                                            containerContractsRow
                                                                ?.dateNachalaArendy),
                                                        'date_oconchaniya':
                                                            supaSerialize<
                                                                    DateTime>(
                                                                containerContractsRow
                                                                    ?.dateOkonchaniyaArendy),
                                                        'kolichestvo_dnei':
                                                            containerContractsRow
                                                                ?.colichestvoDnei,
                                                        'cena_za_sutki':
                                                            containerContractsRow
                                                                ?.carCenaSutkiSkidka,
                                                        'name_city':
                                                            containerContractsRow
                                                                ?.vyezdCity,
                                                        'stoimost_vyezda':
                                                            containerContractsRow
                                                                ?.vyezdCena,
                                                        'cena_za_arendy':
                                                            containerContractsRow
                                                                ?.stoimostArendyBezDepozita,
                                                        'zalog_summa':
                                                            valueOrDefault<int>(
                                                          containerContractsRow
                                                              ?.depozitKassa,
                                                          0,
                                                        ),
                                                        'vyhodnoi_den':
                                                            containerContractsRow
                                                                ?.vyhodnoyi,
                                                        'type_dogovor':
                                                            containerContractsRow
                                                                ?.vidDogovora,
                                                        'id_contract':
                                                            widget!.id,
                                                        'cardoo_cena':
                                                            containerContractsRow
                                                                ?.cardooCena,
                                                        'number_dogovor':
                                                            containerContractsRow
                                                                ?.nomerDogovora,
                                                        'type': true,
                                                        'type_oplaty':
                                                            containerContractsRow
                                                                ?.nalichka,
                                                      });
                                                      _model.progress = 0.63;
                                                      safeSetState(() {});
                                                      await BookingTable()
                                                          .insert({
                                                        'created_at': supaSerialize<
                                                                DateTime>(
                                                            getCurrentTimestamp),
                                                        'car_id':
                                                            containerContractsRow
                                                                ?.carId,
                                                        'car_data':
                                                            '${containerContractsRow?.markaAvto}  ${containerContractsRow?.modelAvto}  ${containerContractsRow?.gosNomer}',
                                                        'klient_id':
                                                            containerContractsRow
                                                                ?.idClient,
                                                        'klient_data':
                                                            '${containerContractsRow?.clientFamiliya}  ${containerContractsRow?.clientImya}  ${containerContractsRow?.clientOtchestvo}',
                                                        'start_date': supaSerialize<
                                                                DateTime>(
                                                            containerContractsRow
                                                                ?.dateNachalaArendy),
                                                        'end_date': supaSerialize<
                                                                DateTime>(
                                                            containerContractsRow
                                                                ?.dateOkonchaniyaArendy),
                                                        'dopolnitelno': '',
                                                        'status':
                                                            containerContractsRow
                                                                        ?.vidDogovora ==
                                                                    false
                                                                ? 'paid'
                                                                : 'taxi',
                                                        'cena_sutki_so_skidkoi':
                                                            containerContractsRow
                                                                ?.carCenaSutkiSkidka,
                                                        'kolvo_dneiy':
                                                            containerContractsRow
                                                                ?.colichestvoDnei,
                                                        'zadatok':
                                                            containerContractsRow
                                                                ?.depozitKassa,
                                                        'obshaya_summa':
                                                            containerContractsRow
                                                                ?.stoimostArendyBezDepozita,
                                                        'viezd_city':
                                                            containerContractsRow
                                                                ?.vyezdCity,
                                                        'cena_viezd':
                                                            containerContractsRow
                                                                ?.vyezdCena,
                                                        'city_company':
                                                            containerContractsRow
                                                                ?.cityDogovor,
                                                        'id_city_company':
                                                            containerContractsRow
                                                                ?.cityId,
                                                        'type_dogovor':
                                                            containerContractsRow
                                                                ?.vidDogovora,
                                                        'status_avto': true,
                                                        'company':
                                                            containerContractsRow
                                                                ?.companyName,
                                                        'id_company':
                                                            containerContractsRow
                                                                ?.companiId,
                                                        'id_maneger':
                                                            containerContractsRow
                                                                ?.idManager,
                                                        'role_manager':
                                                            containerContractsRow
                                                                ?.roleAvtor,
                                                        'data_manager':
                                                            containerContractsRow
                                                                ?.dataManager,
                                                        'idDogovor':
                                                            containerContractsRow
                                                                ?.id,
                                                        'vyhodnoiDay':
                                                            containerContractsRow
                                                                ?.vyhodnoyi,
                                                      });
                                                      _model.progress = 0.7;
                                                      safeSetState(() {});
                                                      await CarsTable().update(
                                                        data: {
                                                          'status': 'v_arende',
                                                          'status_boolean':
                                                              true,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id',
                                                          containerContractsRow
                                                              ?.carId,
                                                        ),
                                                      );
                                                      _model.progress = 0.77;
                                                      safeSetState(() {});
                                                      FFAppState().dogovor =
                                                          '1';
                                                      safeSetState(() {});
                                                      _model.progress = 0.84;
                                                      safeSetState(() {});
                                                      _model.podpisat = '1';
                                                      safeSetState(() {});
                                                      _model.progress = 0.91;
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
                                                    containerContractsRow
                                                        ?.dogovorCode)
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
                                                            _model.progress!,
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
