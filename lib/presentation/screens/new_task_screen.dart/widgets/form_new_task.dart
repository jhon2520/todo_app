import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/config/layout/app_layout.dart';
import 'package:task_app/data/models/index.dart';
import 'package:task_app/presentation/screens/new_task_screen.dart/index.dart';
import 'package:task_app/presentation/shared/widgets/index.dart';
import 'package:task_app/presentation/state/tasks_bloc/task_bloc.dart';
import 'package:task_app/utils/index.dart';

class FormNewTask extends StatefulWidget {

  final TaskModel? taskToEdit;


  const FormNewTask({super.key, required this.taskToEdit});

  @override
  State<FormNewTask> createState() => _FormNewTaskState();
}

class _FormNewTaskState extends State<FormNewTask> {

  late TextEditingController controllerDatePicker;
  late TextEditingController controllerTaskName;

  @override
  void initState() {
    controllerTaskName = TextEditingController();
    controllerDatePicker = TextEditingController();
    super.initState();
    _setInitialValuesTaskEditted();
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
            controller: controllerTaskName,
            label: Languages.of(context).labelTask,
            onChanged: (value) => _onchangeName(value,state),
          ),
          const CustomSpacer(spacerEnum: SpacerEnum.spacingM),
          CustomDatePickerField(
            taskToEdit: widget.taskToEdit,
            label: Languages.of(context).labelDeadline,
            controller: controllerDatePicker,
          ),
          const CustomSpacer(spacerEnum: SpacerEnum.spacingM),
          CustomLevelSelector(taskToEdit: widget.taskToEdit,)

        ],
      )),
    );
  }

  void _setInitialValuesTaskEditted(){
    if(widget.taskToEdit != null){
      controllerTaskName.text = widget.taskToEdit?.taksName! ?? "";
      controllerDatePicker.text = FormatsUtils.formatDates(widget.taskToEdit?.deadLine);
    }
  }
  void _onchangeName(String value, TaskState state) {

    if (widget.taskToEdit != null) {
      context.read<TaskBloc>().add(EditedTaskEvent(
          taskToEditId: state.taskToEdit?.copyWith(taksName: value)));
      return;
    }

    final TaskModel activeTask = TaskModel();

    context.read<TaskBloc>().add(ActivadedCurrentTaks(
        newActiveTask: state.activeTask == null
            ? activeTask.copyWith(taksName: value)
            : state.activeTask?.copyWith(taksName: value)));
  }




}