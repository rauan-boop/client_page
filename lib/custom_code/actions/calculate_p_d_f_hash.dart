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
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

Future<String> calculatePDFHash(String? pdfUrl) async {
  if (pdfUrl == null || pdfUrl.isEmpty) {
    return 'error: no url provided';
  }

  try {
    // Скачиваем байты файла по ссылке
    final response = await http.get(Uri.parse(pdfUrl));
    if (response.statusCode != 200) return 'error: download failed';

    // Считаем хэш
    var hash = sha256.convert(response.bodyBytes);
    return hash.toString();
  } catch (e) {
    return 'error: $e';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
