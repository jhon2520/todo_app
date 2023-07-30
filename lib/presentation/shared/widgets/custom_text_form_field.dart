import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';


class CustomTextFormField extends StatelessWidget {

  final String label;

  const CustomTextFormField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {

    final outlineInputBorder = OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppLayout.mainBodyRaidus),
          borderSide: BorderSide(
            color: AppColors.secondColor
          )
        );
    return TextFormField(
      style: AppFonts.fontStyle.copyWith(color: AppColors.mainColor),
      decoration: InputDecoration(
        label: Text(label),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder.copyWith(borderSide: BorderSide(color: AppColors.mainColor)),
        border: outlineInputBorder,

      ),
    );
  }
}