import 'package:deaf_assist/presentation/pages/assist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const ProviderScope(
      child: MaterialApp(
    home: AssistPage(),
    debugShowCheckedModeBanner: false,
  )));
}
