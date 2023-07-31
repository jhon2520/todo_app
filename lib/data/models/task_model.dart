import 'package:flutter/material.dart';
import 'package:task_app/utils/index.dart';

class TaskModel{
  String? id;
  String? taksName;
  DateTime? deadLine;
  LevelTaskEnum? level;
  Color? levelColor;

  TaskModel({
    this.id,
    this.taksName,
    this.deadLine,
    this.level,
    this.levelColor
  });


  TaskModel copyWith({
    String? id,
    String? taksName,
    DateTime? deadLine,
    LevelTaskEnum? level,
    Color? levelColor,
  }){
    return TaskModel(
      id: id ?? this.id,
      taksName: taksName ?? this.taksName,
      deadLine: deadLine ?? this.deadLine,
      level: level ?? this.level,
      levelColor: levelColor ?? this.levelColor
    );
  }


}