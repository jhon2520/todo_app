import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';

class CustomPrimaryButton extends StatelessWidget {

  final String label;
  final void Function()? onPressed;

  const CustomPrimaryButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        disabledBackgroundColor: AppColors.disableButton
      ),
      onPressed: onPressed , 
      child: Text(label, style: AppFonts.fontStyle.copyWith(color: AppColors.whiteColor),)
    );
  }
}