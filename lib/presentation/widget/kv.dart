import 'package:shared_preferences/shared_preferences.dart';
import 'bookmark_model.dart';

Future<void> saveBookMark(List<BookmarkModel> models) async {
  //引数modelsの型はList<BookmarkModel>であるため、setStringのString型では保存できない。
  //そのため、ここでBookmarkModel内のtextプロパティーを抽出する必要がある。
  final texts = models.map((m) => m.text).toList();
  final prefs = await SharedPreferences.getInstance();
  //prefsに値をセットする。'BookMark'がkey,[texts]が保存される値。
  await prefs.setStringList(
    'BookMark',
    texts,
  );
}

Future<List<BookmarkModel>> loadBookMark() async {
  final prefs = await SharedPreferences.getInstance();
  //textsの中に上で保存したString型のListを格納。何も無いと[]を返す
  final texts = prefs.getStringList('BookMark') ?? [];
  //textsの中にはBookmarkModelのString型のtextプロパティーのリストが入っているので、
  //textプロパティーのリスト→BookmarkModelが入っているListに変換しmodelsに格納。
  final models = texts.map((t) => BookmarkModel(t)).toList();
  return models;
}
