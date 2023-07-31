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
