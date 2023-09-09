import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';

class CustomPrimaryButton extends StatelessWidget {

  final String label;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final TextStyle? style;

  const CustomPrimaryButton({super.key, 
    required this.label, 
    required this.onPressed,
    this.backgroundColor = AppColors.mainColor,
    this.style,
  
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledBackgroundColor: AppColors.disableButton
      ),
      onPressed: onPressed , 
      child: Text(label, style: style ?? 
        AppFonts.fontStyle.copyWith(color: AppColors.whiteColor),)
    );
  }
}