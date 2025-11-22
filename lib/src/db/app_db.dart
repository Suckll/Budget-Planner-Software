import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDb {
  static final AppDb instance = AppDb._init();
  static Database? _database;

  AppDb._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb("budget.db");
    return _database!;
  }

  Future<Database> _initDb(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDb,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute("ALTER TABLE transactions ADD COLUMN category TEXT");
        }
      },
    );
  }

  Future _createDb(Database db, int version) async {
    await db.execute('''
    CREATE TABLE transactions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      type TEXT,
      amount REAL,
      note TEXT,
      category TEXT,
      date TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT UNIQUE,
      email TEXT UNIQUE,
      password TEXT
    )
  ''');
  }

  Future<int> insertTransaction(Map<String, dynamic> data) async {
    final db = await instance.database;
    return db.insert('transactions', data);
  }

  Future<List<Map<String, dynamic>>> getTransactions() async {
    final db = await instance.database;
    return db.query('transactions', orderBy: "id DESC");
  }

  Future<int> deleteTransaction(int id) async {
    final db = await instance.database;
    return db.delete("transactions", where: "id = ?", whereArgs: [id]);
  }

  Future<int> registerUser(
    String username,
    String email,
    String password,
  ) async {
    final db = await database;
    return await db.insert("users", {
      "username": username,
      "email": email,
      "password": password,
    });
  }

  Future<Map<String, dynamic>?> loginUser(
    String username,
    String password,
  ) async {
    final db = await database;
    final result = await db.query(
      "users",
      where: "username = ? AND password = ?",
      whereArgs: [username, password],
    );
    if (result.isNotEmpty) return result.first;
    return null;
  }
}
