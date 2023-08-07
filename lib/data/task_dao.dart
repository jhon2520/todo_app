import 'dart:developer';

import 'package:sembast/sembast.dart';
import 'package:task_app/data/app_database.dart';
import 'package:task_app/domain/models/index.dart';

class TaskDao{

  static const String taskStoreName = "tasks";

  // store a map of information, tasks.db constains task objets
  final _tasksStore = intMapStoreFactory.store(taskStoreName);

  // get instance of open db
  Future<Database?> get _db async => await AppDataBase.instance.database;

  Future insert(TaskModel task) async{
    log("::::::::::: task insert in db ::::::::");
    await _tasksStore.add((await _db) as DatabaseClient, task.toMap());
  }

  Future update(TaskModel task)async{
    final finder = Finder(filter: Filter.equals("id", task.id));
    await _tasksStore.update((await _db) as DatabaseClient, task.toMap(),finder: finder);
  }

  Future delete(TaskModel task)async{
    log("::::::::::: task deleted in db ::::::::");
    final finder = Finder(filter: Filter.equals("id", task.id));
    await _tasksStore.delete((await _db) as DatabaseClient,finder: finder);
  }

  Future<List<TaskModel>> getAll()async{
    log("::::::::::: get all task in db ::::::::");

    final finder = Finder(sortOrders: [
      SortOrder("taksName")
    ]);
    final recordSnapshot = await _tasksStore.find((await _db) as DatabaseClient,finder: finder);
    
    return recordSnapshot.map((snapshot){
      final task = TaskModel.fromMap(snapshot.value);
      task.idDB = snapshot.key.toString();
      return task;
    }).toList();
  }

  Future deleteAllTaskDB()async{
    await _tasksStore.drop( (await _db) as DatabaseClient);
  }

}