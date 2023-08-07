import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:task_app/utils/index.dart';

class TaskModel{
  String? id;
  String? idDB;
  String? taksName;
  DateTime? deadLine;
  LevelTaskEnum? level;
  Color? levelColor;

  TaskModel({
    this.id,
    this.idDB,
    this.taksName,
    this.deadLine,
    this.level,
    this.levelColor
  });

  TaskModel copyWith({
    String? id,
    String? idDB,
    String? taksName,
    DateTime? deadLine,
    LevelTaskEnum? level,
    Color? levelColor,
  }){
    return TaskModel(
      id: id ?? this.id,
      idDB: idDB ?? this.idDB,
      taksName: taksName ?? this.taksName,
      deadLine: deadLine ?? this.deadLine,
      level: level ?? this.level,
      levelColor: levelColor ?? this.levelColor
    );
  }

  factory TaskModel.fromMap (Map<String, dynamic> map){

    return TaskModel(
      id:map["id"],
      idDB:map["idDB"],
      taksName:map["taksName"],
      deadLine: map["deadLine"] != null ? DateTime.tryParse( map["deadLine"]) : null,
      level:map["level"] != null ? LevelTaskEnum.values.firstWhereOrNull((element) => element.toString() ==map["level"]  ) : null,
      levelColor:map["levelColor"] != null ? Color( int.parse(map["levelColor"])) : null
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "id": id, 
      "idDB": idDB, 
      "taksName": taksName, 
      "deadLine": deadLine.toString(), 
      "level": level.toString(), 
      "levelColor": levelColor?.value.toString(), 
    };
  }


}