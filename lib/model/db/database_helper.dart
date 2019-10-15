import 'dart:async';
import 'dart:io';
import 'package:binary_mobile_app/model/authentication/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String accountsTable = 'Accounts';
  String colId = 'id';
  String colToken = 'token';
  String colCurrency = 'currency';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  void _createDB(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $accountsTable ($colId	TEXT PRIMARY KEY,  $colToken	TEXT, $colCurrency	TEXT);");
    print("Accounts Table Created!");
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "accounts.db";
    var userDatabase = openDatabase(path, version: 1, onCreate: _createDB);
    return userDatabase;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> getSavedUsers() async {
    Database db = await this.database;
    var res = await db.query(accountsTable);
    return res;
  }
  
//
//  Future<Map<String, dynamic>> getUser(String id) async {
//    Database db = await this.database;
//    var res = await db.query(userTable, where: '$colId = ?', whereArgs: [id]);
//    if (res.length > 0) {
//      return res[0];
//    } else {
//      return null;
//    }
//  }

//  Future<List<Map<String, dynamic>>> getFavoritesUsers() async {
//    Database db = await this.database;
//    var res = await db.rawQuery(
//        'SELECT $userTable.$colId, $userTable.$colFirstName,$userTable.$colLastName,$userTable.$colEmail,$userTable.$colGender,$userTable.$colPhoneNo,$userTable.$colDateOfBirth, $favoritesTable.$colOrder FROM $userTable INNER JOIN $favoritesTable ON $userTable.$colId=$favoritesTable.$colId ORDER BY $favoritesTable.$colOrder;');
//    return res;
//  }



  Future<int> insertAccount(TokenInfo tokenInfo) async {
    Database db = await this.database;
    var res = 0;
    res = await db.insert(accountsTable, tokenInfo.toMap());
    print("User added to DB");
    return res;
  }


/*
  Future<int> getLastOrder(String table) async {
    int maxOrder = 0;
    Database db = await this.database;
    List<Map<String, dynamic>> x =
    await db.rawQuery('SELECT $colOrder FROM $table');
    if (x.length > 0) {
      Map<String, dynamic> lastItem = x[x.length - 1];
      if (lastItem.containsKey('$colOrder')) {
        maxOrder = lastItem['$colOrder'] + 1;
        print("Max order: $maxOrder");
      }
    }
    return maxOrder;
  } */

  /*
  Future<int> addToFavorites(User user) async {
    Database db = await this.database;
    var maxOrder = await getLastOrder(favoritesTable);
    var res = await db.insert(
        favoritesTable, {"$colId": "${user.id}", "$colOrder": maxOrder});
    print("add to fav res: $res");
    return res;
  }

  Future<int> deleteFromFavorites(User user) async {
    Database db = await this.database;
//    var res = await db.rawDelete('DELETE FROM $userTable WHERE $colId = ${user.id}');
    var res = await db
        .delete(favoritesTable, where: '$colId = ?', whereArgs: [user.id]);
    print("delete from fav res: $res");
    return res;
  }

  Future<int> updateFavUser(User user) async {
    Database db = await this.database;
    var res = await db.update(favoritesTable, {"$colOrder": user.orderInList},
        where: '$colId = ?', whereArgs: [user.id]);
    return res;
  }

  Future<int> deleteFromSyncs(String id) async {
    Database db = await this.database;
    var res =
    await db.delete(apiSyncsTable, where: '$colId = ?', whereArgs: [id]);
    print("delete from sync res: $res");
    return res;
  }

  Future<int> updateUser(User user) async {
    Database db = await this.database;
    var res = await db.update(userTable, user.toMapForDB(),
        where: '$colId = ?', whereArgs: [user.id]);
    return res;
  }

  updateUserID(User user, String newID) async {
    Database db = await this.database;
    var res = await db.update(userTable, {"$colId": "$newID"},
        where: '$colId = ?', whereArgs: [user.id]);
    return res;
  }

  Future<int> deleteUser(User user) async {
    Database db = await this.database;
//    var res = await db.rawDelete('DELETE FROM $userTable WHERE $colId = ${user.id}');
    var res =
    await db.delete(userTable, where: '$colId = ?', whereArgs: [user.id]);
    return res;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
    await db.rawQuery('SELECT * FROM $userTable');
    return x.length;
  }

  Future<bool> isFavUser(User user) async {
    Database db = await this.database;
    var x = await db
        .query("$favoritesTable", where: '$colId = ?', whereArgs: [user.id]);
    return x.length > 0;
  }

  Future<bool> isSavedUser(User user) async {
    Database db = await this.database;
    var x =
    await db.query("$userTable", where: '$colId = ?', whereArgs: [user.id]);
    return x.length > 0;
  }

  Future<int> addToSyncs(User user, int syncStatus) async {
    Database db = await this.database;
    var res = 0;
    switch (syncStatus) {
      case STATUS_ADD:
        if (!await _isSyncAlreadyAdded(user, STATUS_ADD)) {
          res = await db.insert(apiSyncsTable,
              {"$colId": "${user.id}", "$colSyncStatus": STATUS_ADD});
        }
        break;
      case STATUS_UPDATE:
        if (!await _isSyncAlreadyAdded(user, STATUS_ADD) && !await _isSyncAlreadyAdded(user, STATUS_UPDATE)){
          res = await db.insert(apiSyncsTable,
              {"$colId": "${user.id}", "$colSyncStatus": STATUS_UPDATE});
        }
        break;
      case STATUS_DELETE:
        if (await _isSyncAlreadyAdded(user, STATUS_ADD) || await _isSyncAlreadyAdded(user, STATUS_UPDATE)){
          await deleteFromSyncs(user.id);
        }
        res = await db.insert(apiSyncsTable,
            {"$colId": "${user.id}", "$colSyncStatus": STATUS_DELETE});
        break;
    }

    print("added to sync res: $res");
    return res;
  }

  Future<bool> _isSyncAlreadyAdded(User user, int syncStatus) async {
    Database db = await this.database;
    var x = await db.query("$apiSyncsTable",
        where: '$colId = ? AND $colSyncStatus = ?',
        whereArgs: [user.id, syncStatus]);
    return x.length > 0;
  }

  Future<List<Map<String, dynamic>>> getSyncList() async {
    Database db = await this.database;
    var res = await db.query(apiSyncsTable);
    return res;
  }
   */
}
