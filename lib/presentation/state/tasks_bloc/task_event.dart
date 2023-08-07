part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class ActivatedTaksEvent extends TaskEvent{
  final TaskModel? task;

  ActivatedTaksEvent({this.task});
}

class ActivadedCurrentTaks extends TaskEvent{
  final TaskModel? newActiveTask;
  ActivadedCurrentTaks({this.newActiveTask});
}

class DeactivatedCurrrentTask extends TaskEvent{}

class DeletedTaskEvent extends TaskEvent{

  final String? idToDelete;

  DeletedTaskEvent({this.idToDelete});

}

class ActivatedTaskToEdit extends TaskEvent{
  final TaskModel? taskToEdit;

  ActivatedTaskToEdit({this.taskToEdit});

}

class EditedTaskEvent extends TaskEvent{

  final TaskModel? taskToEditId;

  EditedTaskEvent({this.taskToEditId});

}