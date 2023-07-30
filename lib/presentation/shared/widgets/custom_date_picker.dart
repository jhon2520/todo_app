import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/utils/index.dart';


class CustomDatePickerField extends StatelessWidget {

  final TextEditingController controller;
  final String label;


  const CustomDatePickerField({super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {

      final outlineInputBorder = OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppLayout.mainBodyRaidus),
          borderSide: BorderSide(
            color: AppColors.secondColor
          )
        );


      return SizedBox(
          height: AppLayout.heightFormFields,
          child: TextFormField(
            controller: controller,
            enableInteractiveSelection: false,
            onChanged: (value) {},
            onTap: () => _onTap(context),
            style: AppFonts.fontStyle,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.calendar_month,
                  color: AppColors.mainColor, size: 14),
              suffixIconColor: AppColors.secondColor,
              label: Text(label,
                  style: AppFonts.fontStyle),
              focusedBorder: outlineInputBorder,
              enabledBorder:outlineInputBorder
            ),
          ),
        );
  }

    Future<void> _onTap(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());

    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (newDate == null) {
      return;
    }


    controller.text =  FormatsUtils.formatDates(newDate);
  }
}