part of 'task_bloc.dart';

@immutable
abstract class TaskState {

  final bool existTasks;
  final List<TaskModel>? tasks;
  final TaskModel? activeTask;

  const TaskState({this.existTasks = false, this.tasks,this.activeTask});

}

class TaskInitial extends TaskState {

  const TaskInitial():super(existTasks: false,tasks:  null,activeTask: null);

}

class TasksSetSate extends TaskState{

  final List<TaskModel>? newTasks;
  final TaskModel? currentTask;


  const TasksSetSate({this.newTasks, this.currentTask}):super(existTasks: true,tasks: newTasks, activeTask: currentTask);
}
