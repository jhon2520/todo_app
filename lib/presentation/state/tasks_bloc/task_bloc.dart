import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_app/data/models/index.dart';
import 'package:collection/collection.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskInitial()) {


    on<ActivatedTaksEvent>((event, emit) {
      log("Se activaron las tareas");

      List<TaskModel> listAux = [...[event.task!], ...state.tasks ?? []];
      emit(TasksSetSate(newTasks: listAux,currentTask: state.activeTask, currentTaskToEdit: state.taskToEdit));
    });

    on<ActivadedCurrentTaks>((event, emit) {
      log("se está cambiando la tarea activa");
      emit(TasksSetSate(currentTask: event.newActiveTask,newTasks: state.tasks,currentTaskToEdit: state.taskToEdit));
    });

    on<DeactivatedCurrrentTask>((event, emit){
      log("se eliminó la tarea activa");
      emit(TasksSetSate(currentTask: null,newTasks: state.tasks,currentTaskToEdit: state.taskToEdit));
    });

    on<DeletedTaskEvent>((event, emit) {
      log("se eliminó una tarea");
      List<TaskModel>? newTasks = state.tasks?.where((element) => element.id != event.idToDelete).toList();
      emit(TasksSetSate(currentTask: null,newTasks: newTasks,currentTaskToEdit: state.taskToEdit));

    });

    on<ActivatedTaskToEdit>((event, emit) {
      log("se activo la tarea a editar llego");
      emit(TasksSetSate(currentTask: null,newTasks: state.tasks,currentTaskToEdit: event.taskToEdit));

    });

    on<EditedTaskEvent>((event, emit) {
      log("se está editando una tarea");
      List<TaskModel>? newTasksEdited = state.tasks!.map((e) {
        return e.id == state.taskToEdit!.id ? event.taskToEditId: e;
      }
      ).cast<TaskModel>().toList();


      emit(TasksSetSate(newTasks:newTasksEdited,currentTask: state.activeTask,currentTaskToEdit: event.taskToEditId));
      
    });
  }
}
