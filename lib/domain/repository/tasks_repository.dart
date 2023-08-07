

import 'package:task_app/domain/models/index.dart';

abstract class TaskRespository{


  Future<List<TaskModel>> getSavedTask();

  Future<void> saveTask(TaskModel taskToSave);

  Future<void> deleteTask(TaskModel taskToDelete);

  Future<void> editTask(TaskModel taskToEdit);

  Future<void> deleteAllTask();

}