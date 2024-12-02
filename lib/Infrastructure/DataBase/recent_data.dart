import 'dart:io';

import 'package:instasave/Infrastructure/Commons/Constants/database_constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RecentDBHelper {
  Database? database;

  Future<Database> checkDB() async {
    if (database != null) {
      return database!;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, "recent.db");

    return openDatabase(path, version: 1, onCreate: (db, version) {
      String query =
          "CREATE TABLE recent (id INTEGER PRIMARY KEY AUTOINCREMENT ,userName TEXT,thumbnailUrl ,feedUrl TEXT ,caption TEXT ,profilePic TEXT,mediaType TEXT)";
      db.execute(query);
    });
  }

  Future<int> insertRecent(
      {String? userName,
      String? thumbnailUrl,
      String? feedUrl,
      String? caption,
      String? profilePic,
      String? mediaType}) async {
    database = await checkDB();
    return await database!.insert(DataBaseConstant.dataBaseName, {
      DataBaseConstant.usernameKey: userName,
      DataBaseConstant.feedUrlKey: feedUrl,
      DataBaseConstant.captionKey: caption,
      DataBaseConstant.profilePicKey: profilePic,
      DataBaseConstant.mediaTypeKey: mediaType,
      DataBaseConstant.thumbnailUrlKey: thumbnailUrl
    });
  }

  Future<List<Map<String, dynamic>>> readRecentData() async {
    database = await checkDB();
    String query = "";

      query = "SELECT * FROM ${DataBaseConstant.dataBaseName}";

    var res = database!.rawQuery(query);
    return res;
  }

  Future<int> deleteRecent(int id) async {
    database = await checkDB();
    var res = database!.delete(DataBaseConstant.dataBaseName, where: "id=?", whereArgs: [id]);
    return res;
  }
}
