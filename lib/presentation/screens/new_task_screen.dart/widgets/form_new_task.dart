import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/config/layout/app_layout.dart';
import 'package:task_app/data/models/index.dart';
import 'package:task_app/presentation/screens/new_task_screen.dart/index.dart';
import 'package:task_app/presentation/shared/widgets/index.dart';
import 'package:task_app/presentation/state/tasks_bloc/task_bloc.dart';
import 'package:task_app/utils/index.dart';

class FormNewTask extends StatefulWidget {

  const FormNewTask({super.key});

  @override
  State<FormNewTask> createState() => _FormNewTaskState();
}

class _FormNewTaskState extends State<FormNewTask> {

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    final state  = context.watch<TaskBloc>().state;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppLayout.spacingM),
      width: double.infinity,
      child: Form(
        
        child: Column(
        children: [
          CustomTextFormField(
            label: Languages.of(context).labelTask,
            onChanged: (value) {

              final TaskModel activeTask = TaskModel();

        
              context.read<TaskBloc>().add(ActivadedCurrentTaks(
                newActiveTask: state.activeTask == null 
                ? activeTask.copyWith(taksName: value) 
                : state.activeTask?.copyWith(
                  taksName: value
                )

              )
            );
            },
          ),
          const CustomSpacer(spacerEnum: SpacerEnum.spacingM),
          CustomDatePickerField(
            label: Languages.of(context).labelDeadline,
            controller: controller,
          ),
          const CustomSpacer(spacerEnum: SpacerEnum.spacingM),
          const CustomLevelSelector()

        ],
      )),
    );
  }
}