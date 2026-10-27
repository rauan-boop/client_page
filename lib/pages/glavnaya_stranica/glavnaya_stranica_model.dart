import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'glavnaya_stranica_widget.dart' show GlavnayaStranicaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GlavnayaStranicaModel extends FlutterFlowModel<GlavnayaStranicaWidget> {
  ///  Local state fields for this page.

  bool? isLinkExpired;

  bool? contract;

  bool? act;

  bool? soglasie;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
