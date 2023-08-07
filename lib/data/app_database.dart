

import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast_io.dart';

class AppDataBase{

  static final AppDataBase _singleton = AppDataBase._();
  static AppDataBase get instance => _singleton;

  // open database
  // completer tranform synchhronous code into asynchronous code
  Completer<Database>? _dbOpenCompleter;


  AppDataBase._();

  Future<Database?> get database async{
    // return database if this is open or create a new instance if this is closed
    if(_dbOpenCompleter == null){
      _dbOpenCompleter = Completer();
      _openDataBase();
    }
    return _dbOpenCompleter?.future;
  }

  Future _openDataBase()async{
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path,"tasks.db");
    final database = await databaseFactoryIo.openDatabase(dbPath);
    _dbOpenCompleter?.complete(database);
  }


}