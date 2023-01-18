import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../clases/cliente.dart';

class DatabaseHelper {
  DatabaseHelper._privateConsturctor();
  static final DatabaseHelper instance = DatabaseHelper._privateConsturctor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'Sigas.db');
    return await openDatabase(
      path,
      version: 4,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE Customer(
      id INTEGER PRIMARY KEY AUTOINCREMENT,  
      CustomerCode TEXT, 
      CustomerName TEXT, 
      CustomerDir TEXT, 
      Phone1 TEXT, 
      Phone2 TEXT, 
      Comment1 TEXT
      )''');
    // await db.execute('''CREATE TABLE InvoiceHeaders(
    //     ID PRIMARY KEY AUTOINCREMENT,
    //   ,SALESID TEXT
    //   ,INVOICEID TEXT
    //   ,PAYMENT TEXT
    //   ,INVOICEDATE TEXT
    //   ,DUEDATE TEXT
    //   ,INVOICEAMOUNT TEXT
    //   ,INVOICINGNAME TEXT
    //   ,PrintCounterDevolution TEXT
    //   ,PrintCounterCreditNote TEXT
    //   ,INVOICEACCOUNT TEXT
    //   ,PayedAmount TEXT
    //   )''');
    // await db.execute('''CREATE TABLE SalesOrders(
    //     ID PRIMARY KEY AUTOINCREMENT,
    //   ,Cash TEXT
    //   ,Change TEXT
    //   ,CreateAt TEXT
    //   ,CreateBy TEXT
    //   ,CustomerID TEXT
    //   ,Date TEXT
    //   ,GPID TEXT
    //   ,IsDelete TEXT
    //   ,Totals TEXT
    //   ,VAT TEXT
    //   ,UserName TEXT
    //   ,UserCode TEXT
    //   ,UserID TEXT
    //   ,Status TEXT
    //   ,Commets TEXT
    //   )''');

    // await db.execute('''CREATE TABLE SalesLines(
    //  ID PRIMARY KEY AUTOINCREMENT,
    //   ,SalesOrdersID TEXT
    //   ,Price TEXT
    //   ,Qty TEXT
    //   ,ProductID TEXT
    //   ,ProductCode TEXT
    //   ,Products_ID TEXT
    //   ,ProductName TEXT
    //   )''');

    // await db.execute('''CREATE TABLE Products(
    //   ID PRIMARY KEY AUTOINCREMENT,

    //   ,IsDelete TEXT
    //   ,Price TEXT
    //   ,ProductCode TEXT
    //   ,ProductID TEXT
    //   ,ProductName TEXT
    //   ,Qty TEXT
    //   ,TypeOSales TEXT
    //   ,UoM TEXT
    //   )''');

    // await db.execute('''CREATE TABLE PaymentOrders(
    //   ID PRIMARY KEY AUTOINCREMENT,

    //  Id TEXT
    //   ,VendorID TEXT
    //   ,Datetime TEXT
    //   ,Amount TEXT
    //   ,Method TEXT
    //   ,BankName TEXT
    //   ,CheckNumber TEXT
    //   ,CheckDate TEXT
    //   ,IsEnabled TEXT
    //   ,Customer_Code TEXT
    //   ,IsOpen TEXT
    //   ,Imported TEXT
    //   )''');
    // await db.execute('''CREATE TABLE PaymentItems(
    //   Id  PRIMARY KEY AUTOINCREMENT
    //   ,PaymentOrderId TEXT
    //   ,InvoiceNumber TEXT
    //   ,AmountApply TEXT
    //   ,InvoiveAmountAtMoment TEXT
    //   ,IsEnabled TEXT
    //   )''');
  }

  Future<List<Customers>> getCustomers() async {
    Database db = await instance.database;
    var customers = await db.query('Customer', orderBy: 'CustomerName');
    List<Customers> customersList = customers.isNotEmpty
        ? customers.map((c) => Customers.fromMap(c)).toList()
        : [];
    return customersList;
  }

  Future<int> Add(Customers customers) async {
    Database db = await instance.database;
    return await db.insert('Customer', customers.toMap());
  }

  Future<int> update(Customers customers) async {
    Database db = await instance.database;
    int id = customers.toMap()['id'];
    return await db.update('Customers', customers.toMap(),
        where: '$id = ?', whereArgs: [id]);
  }
}
