import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_app/domain/models/index.dart';
import 'package:task_app/infraestructure/driven_adapters/db_local/task_db_local/task_db_repository.dart';
import 'package:collection/collection.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {

  TaskDBRepostory taskDBRepostory;


  TaskBloc(this.taskDBRepostory) : super(const TaskInitial()) {

    on<GetPreviousSavedTask>((event, emit) async{
      List<TaskModel> savedTask = await taskDBRepostory.getSavedTask();
      emit(TasksSetSate(newTasks: savedTask,currentTask: null, currentTaskToEdit:null));

    });

    on<DeleteAllTasks>((event, emit) async{
      await taskDBRepostory.deleteAllTaskDB();
      emit(const TasksSetSate(newTasks: null,currentTask: null, currentTaskToEdit:null));
    });

    on<ActivatedTaksEvent>((event, emit) async{
      log("Se activaron las tareas");
      List<TaskModel> listAux = [...[event.task!], ...state.tasks ?? []];
      await taskDBRepostory.saveTask(event.task!);
      emit(TasksSetSate(newTasks: listAux,currentTask: state.activeTask, currentTaskToEdit: state.taskToEdit));
    });

    on<ActivadedCurrentTaks>((event, emit) {
      log("se está cambiando la tarea activa");
      emit(TasksSetSate(currentTask: event.newActiveTask,newTasks: state.tasks,currentTaskToEdit: state.taskToEdit));
    });

    on<DeactivatedCurrrentTask>((event, emit)async{
      log("se eliminó la tarea activa");
      emit(TasksSetSate(currentTask: null,newTasks: state.tasks,currentTaskToEdit: state.taskToEdit));
    });

    on<DeletedTaskEvent>((event, emit)async {
      log("se eliminó una tarea");
      TaskModel? taskToDelete = state.tasks?.firstWhereOrNull((element) => element.id == event.idToDelete);
      List<TaskModel>? newTasks = state.tasks?.where((element) => element.id != event.idToDelete).toList();
      await taskDBRepostory.deleteTask(taskToDelete!);
      emit(TasksSetSate(currentTask: null,newTasks: newTasks,currentTaskToEdit: state.taskToEdit));

    });

    on<ActivatedTaskToEdit>((event, emit) {
      log("se activo la tarea a editar llego");
      emit(TasksSetSate(currentTask: null,newTasks: state.tasks,currentTaskToEdit: event.taskToEdit));

    });

    on<EditedTaskEvent>((event, emit) async{
      log("se está editando una tarea");
      List<TaskModel>? newTasksEdited = state.tasks!.map((e) {
        return e.id == state.taskToEdit!.id ? event.taskToEditId: e;
      }
      ).cast<TaskModel>().toList();
      await taskDBRepostory.editTask(event.taskToEditId!);
      emit(TasksSetSate(newTasks:newTasksEdited,currentTask: state.activeTask,currentTaskToEdit: event.taskToEditId));
      
    });
  }
}
