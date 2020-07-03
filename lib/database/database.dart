import 'dart:async';
import 'dart:io';

import 'package:flutterecomapp/model/cart_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "EcomCart.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Cart ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "product_name TEXT,"
          "product_image TEXT,"
          "product_description TEXT,"
          "product_price TEXT"
          ")");
    });
  }

  addToCart(Cart cart) async {
    final db = await database;

    var raw = await db.rawInsert(
        "INSERT Into Cart (product_name,product_image,product_description,product_price)"
        " VALUES (?,?,?,?)",
        [cart.name, cart.image, cart.description, cart.price]);
    return raw;
  }

  Future<List<Cart>> getCartDart() async {
    final db = await database;
    var res = await db.query("Cart");
    List<Cart> list =
        res.isNotEmpty ? res.map((c) => Cart.fromMap(c)).toList() : [];
    return list;
  }
}
