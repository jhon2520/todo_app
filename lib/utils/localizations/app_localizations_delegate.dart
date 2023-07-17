import 'package:flutter/material.dart';
import 'package:task_app/utils/localizations/index.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages>{


  @override
  bool isSupported(Locale locale) {
    return ["en","es"].contains(locale.languageCode);
  }

  @override
  Future<Languages> load(Locale locale)=> _load(locale);


  static Future<Languages> _load(Locale locale) async{
    switch(locale.languageCode){
      case "en":
      return LanguageEn();
      case "es":
      return LanguageEs();
      default:
      return LanguageEs();
    }

  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Languages> old)=>false;

}