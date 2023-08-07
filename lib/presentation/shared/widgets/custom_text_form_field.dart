import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';


class CustomTextFormField extends StatelessWidget {

  final String label;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomTextFormField({super.key, required this.label,required this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {

    final outlineInputBorder = OutlineInputBorder(

          borderRadius: BorderRadius.circular(AppLayout.mainBodyRaidus),
          borderSide: const BorderSide(
            color: AppColors.borderFieldsColor,
          )
        );
    return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppLayout.mainBodyRaidus),

        color: AppColors.whiteColor,
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardsShade,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(1,2)

          )
        ]
      ),
      height: AppLayout.heightFormFields,
      child: TextFormField(
        controller: controller ,
        onChanged: onChanged,
        style: AppFonts.fontStyle.copyWith(color: AppColors.mainColor),
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.task, color: AppColors.infoColor, size: AppLayout.iconFormfieldSize),
          label: Text(label, style: AppFonts.fontStyle,),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder.copyWith(borderSide:  BorderSide(color: AppColors.mainColor.withOpacity(0.4))),
          border: outlineInputBorder,
    
        ),
      ),
    );
  }
}