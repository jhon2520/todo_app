import 'package:flutter/material.dart';
import 'package:task_app/config/layout/app_layout.dart';
import 'package:task_app/presentation/shared/widgets/index.dart';
import 'package:task_app/utils/index.dart';

class FormNewTask extends StatelessWidget {
  const FormNewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppLayout.spacingM),
      width: double.infinity,
      child: Form(
        
        child: Column(
        children: [
          CustomTextFormField(
            label: Languages.of(context).labelTask,
          ),
          // CustomTextFormField(),
          // CustomTextFormField(),
        ],
      )),
    );
  }
}