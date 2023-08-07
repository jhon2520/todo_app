import 'package:task_app/domain/models/index.dart';
import 'package:task_app/domain/repository/index.dart';

class TasksUseCase{

  final TaskRespository taskRespository;

  TasksUseCase(this.taskRespository);

  Future<List<TaskModel>> getSavedTask(){
    return taskRespository.getSavedTask();
  }

  Future<void> saveTask(TaskModel taskToSave){
    return taskRespository.saveTask(taskToSave);
  }
  Future<void> deleteTask(TaskModel taskToDelete){
    return taskRespository.deleteTask(taskToDelete);
  }

  Future<void> deleteAllTask(){
    return taskRespository.deleteAllTask();
  }

  Future<void> editTask(TaskModel taskToEdit){
    return taskRespository.editTask(taskToEdit);
  }

}