import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/acteur.dart';

class IsarService {
  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open([ActeurSchema], directory: dir.path);
  }
}
