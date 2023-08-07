part of 'task_bloc.dart';

@immutable
abstract class TaskState {

  final bool existTasks;
  final List<TaskModel>? tasks;
  final TaskModel? activeTask;
  final TaskModel? taskToEdit;

  const TaskState({this.existTasks = false, this.tasks,this.activeTask, this.taskToEdit});

}

class TaskInitial extends TaskState {

  const TaskInitial():super(existTasks: false,tasks:  null,activeTask: null,taskToEdit: null);

}

class TasksSetSate extends TaskState{

  final List<TaskModel>? newTasks;
  final TaskModel? currentTask;
  final TaskModel? currentTaskToEdit;


  const TasksSetSate({this.newTasks, this.currentTask,this.currentTaskToEdit})
  :super(existTasks: true,tasks: newTasks, activeTask: currentTask, taskToEdit: currentTaskToEdit);
}
