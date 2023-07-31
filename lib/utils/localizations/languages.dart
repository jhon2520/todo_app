import 'package:flutter/material.dart';

abstract class Languages{

  static Languages of(BuildContext context){
    return Localizations.of(context, Languages);
  }

  String get appName;

  String get labelWelcome;

  String get labelSelectLanguage;

  String get labelLangaugeChanged;

  String get labelTask;

  String get labelDeadline;

  String get labelLevel;

  String get labelSaveTask;

  String get labelEditTask;

  String get labelCreateTask;

  String get labelNoTask;

  String get labelSelectOne;

  String get labelLevelHigh;

  String get labelLevelMedium;

  String get labelLevelLow;

  String get labelTaskSaved;

}