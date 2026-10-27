import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'page_in_model.dart';
export 'page_in_model.dart';

class PageInWidget extends StatefulWidget {
  const PageInWidget({
    super.key,
    this.id,
    this.type,
  });

  final String? id;
  final String? type;

  static String routeName = 'page-in';
  static String routePath = '/page-In';

  @override
  State<PageInWidget> createState() => _PageInWidgetState();
}

class _PageInWidgetState extends State<PageInWidget> {
  late PageInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageInModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 4000,
        ),
      );
      FFAppState().dogovor = '0';
      FFAppState().akt = '0';
      FFAppState().soglasie = '0';
      safeSetState(() {});
      if (widget!.type == 'subarenda') {
        context.pushNamed(
          SubarendaPageWidget.routeName,
          queryParameters: {
            'id': serializeParam(
              widget!.id,
              ParamType.String,
            ),
            'type': serializeParam(
              widget!.type,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      } else if (widget!.type == 'dop') {
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
      } else {
        context.pushNamed(
          GlavnayaStranicaWidget.routeName,
          queryParameters: {
            'id': serializeParam(
              widget!.id,
              ParamType.String,
            ),
            'type': serializeParam(
              widget!.type,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      }
    });

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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 400.0,
              maxHeight: 900.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'CRM  \"R-CORE\" ',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    '\nАВТОМАТИЗИРОВАННАЯ СИСТЕМА \nУПРАВЛЕНИЯ АВТОПРОКАТОМ ',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/clientpage-pd1zz7/assets/w3kma5sn4my1/логотип_копия.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Lottie.asset(
                    'assets/jsons/87dd7a8a-1185-11ee-a2a3-a329deb85aae.json',
                    width: 317.9,
                    height: 89.03,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
                ),
                Text(
                  'Подождите пока сгенерируются документы',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
