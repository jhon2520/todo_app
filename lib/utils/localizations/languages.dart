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

}