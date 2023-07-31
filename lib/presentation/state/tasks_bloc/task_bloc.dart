import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_app/data/models/index.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskInitial()) {


    on<ActivatedTaksEvent>((event, emit) {
      log("Se activaron las tareas");

      List<TaskModel> listAux = [...[event.task!], ...state.tasks ?? []];
      emit(TasksSetSate(newTasks: listAux,currentTask: state.activeTask));
    });

    on<ActivadedCurrentTaks>((event, emit) {
      log("se está cambiando la tarea activa");
      emit(TasksSetSate(currentTask: event.newActiveTask,newTasks: state.tasks));
    });

    on<DeactivatedCurrrentTask>((event, emit){
      log("se eliminó la tarea activa");
      emit(TasksSetSate(currentTask: null,newTasks: state.tasks));
    });
  }
}
