import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/utils/enums/index.dart';

class ShowSnackBar{

  static void showSnackBar(BuildContext context, SnackBarEnum snackBarEnum, String mensaje){

    Color backgroundColor = AppColors.mainColor;

    switch (snackBarEnum) {
      case SnackBarEnum.error:
        backgroundColor = AppColors.errorColor;
        break;
      case SnackBarEnum.info:
        backgroundColor = AppColors.infoColor;
        break;
      case SnackBarEnum.success:
        backgroundColor = AppColors.succesColor;
        break;
      default:
        backgroundColor = AppColors.mainColor;
        break;
    }

    final SnackBar snackBar = SnackBar(
      backgroundColor: backgroundColor,
      content: Text(mensaje),
      duration: AppLayout.snackBarDuration,
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }

}