import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/data/models/index.dart';
import 'package:task_app/presentation/state/tasks_bloc/task_bloc.dart';
import 'package:task_app/utils/index.dart';


class CustomDatePickerField extends StatelessWidget {

  final TextEditingController controller;
  final String label;


  const CustomDatePickerField({super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {

    final state = context.watch<TaskBloc>().state;

      final outlineInputBorder = OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppLayout.mainBodyRaidus),
          borderSide: const BorderSide(
            color: AppColors.borderFieldsColor
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
            
            controller: controller,
            enableInteractiveSelection: false,
            onChanged: (value) {},
            onTap: () async{
              final DateTime? deadline = await _onTap(context);
              _setDeadlineCurrentTaks(context,state,deadline);


            },
            style: AppFonts.fontStyle,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.calendar_month,
                  color: AppColors.infoColor, size: AppLayout.iconFormfieldSize),
              suffixIconColor: AppColors.secondColor,
              label: Text(label,
                  style: AppFonts.fontStyle),
              focusedBorder: outlineInputBorder,
              enabledBorder:outlineInputBorder
            ),
          ),
        );
  }

    Future<DateTime?> _onTap(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());

    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (newDate == null) {
      return null;
    }
    controller.text =  FormatsUtils.formatDates(newDate);

    return newDate;
    
  }

  void _setDeadlineCurrentTaks(
      BuildContext context, TaskState state, DateTime? dateTime) {
    if (dateTime == null) {
      return;
    }

    final TaskModel activeTask = TaskModel();

    context.read<TaskBloc>().add(ActivadedCurrentTaks(
        newActiveTask: state.activeTask == null
            ? activeTask.copyWith(deadLine: dateTime)
            : state.activeTask?.copyWith(deadLine: dateTime)));
  }
}