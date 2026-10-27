import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/supabase/supabase.dart';

String tekstObratnogoOtscheta(DateTime? createdAt) {
  if (createdAt == null) return "00:00";

  // 1. Приводим время из базы строго к UTC
  final vremyaSozdaniya = createdAt.toUtc();

  // 2. Определяем время смерти ссылки (создание + 2 часа)
  final srokIstecheniya = vremyaSozdaniya.add(Duration(hours: 1));

  // 3. Берем текущее время тоже в UTC
  final seichas = DateTime.now().toUtc();

  // 4. Считаем разницу
  final raznica = srokIstecheniya.difference(seichas);

  // Если время вышло
  if (raznica.isNegative) return "00:00";

  // 5. Форматируем
  String minutes = raznica.inMinutes.toString().padLeft(2, '0');
  String seconds = (raznica.inSeconds % 60).toString().padLeft(2, '0');

  return "$minutes:$seconds";
}
