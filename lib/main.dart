import 'package:deaf_assist/presentation/pages/assist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(0, 236, 54, 54)));
  runApp(const ProviderScope(
      child: MaterialApp(
    home: AssistPage(),
    debugShowCheckedModeBanner: false,
  )));
}
