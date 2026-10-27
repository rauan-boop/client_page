import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'dop_soglashenie_widget.dart' show DopSoglashenieWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DopSoglashenieModel extends FlutterFlowModel<DopSoglashenieWidget> {
  ///  Local state fields for this page.

  bool? isLinkExpired;

  bool? contract;

  bool? act;

  bool? soglasie;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in dop_soglashenie widget.
  List<DopSoglachenieRow>? dsOut;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
