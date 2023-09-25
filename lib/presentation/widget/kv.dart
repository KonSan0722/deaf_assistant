import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveBookMark(String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList(
    'BookMark',
    [value],
  );
}

Future<List> loadBookMark() async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.getStringList('BookMark');
  return value ?? [""];
}
