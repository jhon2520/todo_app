import 'package:task_app/data/task_dao.dart';
import 'package:task_app/domain/models/task_model.dart';
import 'package:task_app/domain/repository/tasks_repository.dart';

class TaskDBRepostory extends TaskRespository with TaskDao{


  @override
  Future<List<TaskModel>> getSavedTask() async{
    final List<TaskModel> listTasksSaved = await getAll();
    return listTasksSaved;
  }

  @override
  Future<void> saveTask(TaskModel taskToSave) async{
    await insert(taskToSave);
  }
  
  @override
  Future<void> deleteTask(TaskModel taskToDelete)async {
    await delete(taskToDelete);
  }
  
  @override
  Future<void> deleteAllTask()async {
    await deleteAllTaskDB();
  }
  
  @override
  Future<void> editTask(TaskModel taskToEdit) async{
    await update(taskToEdit);
  }



}