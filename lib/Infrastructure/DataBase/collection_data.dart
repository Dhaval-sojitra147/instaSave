
// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class CollectionDBHelper {

  Database? database;


  Future<Database> checkDB(String collectionName) async {
    if (database != null) {
      return database!;
    }
    else {
      return await initCollectionDB(collectionName);
    }
  }

  Future<Database> initCollectionDB(String collectionName) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, "$collectionName.db");

    return openDatabase(path, version: 1, onCreate: (db, version) {
      String query =
          "CREATE TABLE $collectionName (id INTEGER PRIMARY KEY AUTOINCREMENT ,Reels TEXT ,Stories TEXT ,Posts TEXT)";
      db.execute(query);
    });
  }
  Future<int> insertCollection(String collectionName,
      {String? Reels, String? Stories, String? Posts}) async {

    database = await checkDB(collectionName);
    if(Reels!=null){
      return await database!.insert(collectionName,
          {"Reels": Reels});
    } else
    if(Stories!=null){
      return await database!.insert(collectionName,
          {"Stories": Stories});
    }else {
      return await database!.insert(collectionName,
          {"Posts": Posts});
    }

  }

  Future<List<Map<String, dynamic>>> readCollectionData({String? std,String? collectionName}) async {
    database = await checkDB(collectionName!);
    String collection=collectionName;
    String query="";
   // if(std!=null){
   //  // query = "SELECT * FROM $collectionName WHERE std = $std";
   // }
   // else{
      query = "SELECT * FROM $collection";
   // }
    var res = database!.rawQuery(query);
    return res;
  }

  void deleteCollection(String collectionName,int id) async {
    database = await checkDB(collectionName);
    database!.delete(collectionName, where: "id=?", whereArgs: [id]);
  }

  Future<int> updateCollection(String collectionName,int id,
      { String? Reels, String? Stories, String? Posts}) async {

    database = await checkDB(collectionName);

    if(Reels!=null){
      return await database!.update(collectionName,
          {"Reels": Reels},where: "id=?", whereArgs: [1]);
    } else
    if(Stories!=null){
      return await database!.update(collectionName,
          {"Stories": Stories},where: "id=?", whereArgs: [1]);
    }else {
      return await database!.update(collectionName,
          {"Posts": Posts},where: "id=?", whereArgs: [1]);
    }
  }


}

///---------------------------


class CollectionDBNameHelper {

  Database? database;


  Future<Database> checkDB() async {
    if (database != null) {
      return database!;
    }
    else {
      return await initCollectionDB();
    }
  }

  Future<Database> initCollectionDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, "CollectionNames.db");

    return openDatabase(path, version: 1, onCreate: (db, version) {
      String query =
          "CREATE TABLE CollectionNames (id INTEGER PRIMARY KEY AUTOINCREMENT ,Collections TEXT)";
      db.execute(query);
    });
  }
  Future<int> insertCollection(String CollectionName) async {
    database = await checkDB();
    return await database!.insert("CollectionNames",
        {"Collections": CollectionName});
  }

  Future<List<Map<String, dynamic>>> readCollectionData({String? std}) async {
    database = await checkDB();
    String query="";
    if(std!=null){
      query = "SELECT * FROM CollectionNames WHERE std = $std";
    }
    else{
      query = "SELECT * FROM CollectionNames";
    }
    var res = database!.rawQuery(query);
    return res;
  }

  void deleteCollection(int id) async {
    database = await checkDB();
    database!.delete("CollectionNames", where: "id=?", whereArgs: [id]);
  }

  void updateCollection(int id,String CollectionName) async {
    database = await checkDB();
    database!.update("CollectionNames",
        {"Collections": CollectionName},
        where: "id=?", whereArgs: [id]);
  }


}