import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'subarenda_widget.dart' show SubarendaWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class SubarendaModel extends FlutterFlowModel<SubarendaWidget> {
  ///  Local state fields for this page.

  String? code;

  String? podpisat;

  double? progres;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in subarenda widget.
  List<DogovorSubarendyRow>? subarendaOut;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - generateSubleaseContract] action in Button widget.
  String? soglasieOut;
  // Stores action output result for [Custom Action - calculatePDFHash] action in Button widget.
  String? hashOut;
  // Stores action output result for [Custom Action - getDeviceInfo] action in Button widget.
  String? deviceInfoOut;
  // Stores action output result for [Backend Call - API (GetIP)] action in Button widget.
  ApiCallResponse? ipOut;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<KompaniyaRow>? companiOut;
  // Stores action output result for [Custom Action - mergeTechnicalPage] action in Button widget.
  String? tehnicalListOut;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
