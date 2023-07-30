import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';

class AppTheme{

  static ThemeData appTheme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: AppColors.mainColor
    );
  }

}