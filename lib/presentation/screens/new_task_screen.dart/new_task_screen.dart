import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/domain/models/index.dart';
import 'package:task_app/presentation/screens/new_task_screen.dart/widgets/index.dart';
import 'package:task_app/presentation/shared/widgets/index.dart';
import 'package:task_app/presentation/state/tasks_bloc/task_bloc.dart';
import 'package:task_app/utils/index.dart';

class NewTaskScreen extends StatelessWidget {

  final TaskModel? taskToEdit;

  const NewTaskScreen({super.key, this.taskToEdit});

  @override
  Widget build(BuildContext context) {



    final TaskState  state  = context.watch<TaskBloc>().state;




    return Scaffold(
      body: Stack(
        children: [


          Positioned(
            left: 20,
            top: 50,
            child: _CustomPopButton(state: state,)),

          const Positioned(
            top: -180,
            right: -120,
            child: _CustomDecoratorBox()),


          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                Text(Languages.of(context).labelCreateTask,style: AppFonts.fontStyle.copyWith(
                  fontSize: FontSizeEnum.h1.size
                ),),
                FormNewTask(taskToEdit:taskToEdit),
                const CustomSpacer(spacerEnum: 	SpacerEnum.spacingX),
                CustomPrimaryButton(
                  onPressed: taskToEdit != null
                      ? ()=>_editAndClose(context, state)
                      : _existTask(state)
                          ? () => _saveAndClose(context, state)
                          : null,
                  label: taskToEdit == null 
                  ? Languages.of(context).labelSaveTask
                  : Languages.of(context).labelEditTask)
  
              ],
            ),
          ),
        ],
      )
    );
  }

  bool _existTask( TaskState state){
    if(state.activeTask == null){
      return false;
    }
    return true;
  }

   _saveAndClose(BuildContext context, TaskState state){
    _saveTaks(context,state);
    _deactivateCurrtenTask(context,state);
    _closeScreen(context);
    ShowSnackBar.showSnackBar(context, SnackBarEnum.success, Languages.of(context).labelTaskSaved);
  }

   _editAndClose(BuildContext context, TaskState state){
    // _editTask(context,state);
    _deactivateCurrtenTask(context,state);
    _closeScreen(context);
    ShowSnackBar.showSnackBar(context, SnackBarEnum.success, Languages.of(context).labelTaskSaved);
  }

  void _saveTaks(BuildContext context, TaskState state) {
    context.read<TaskBloc>().add(ActivatedTaksEvent(
      task: state.activeTask?.copyWith(id:DateTime.now().microsecondsSinceEpoch.toString())));
  }

  void _editTask(BuildContext context, TaskState state){
    context.read<TaskBloc>().add(EditedTaskEvent(taskToEditId: state.taskToEdit));
  }

  void _deactivateCurrtenTask(BuildContext context, TaskState state) {
    context.read<TaskBloc>().add(DeactivatedCurrrentTask());
  }

  void _closeScreen(BuildContext context){
    FocusScope.of(context).unfocus();
    context.pop();
  }
}



class _CustomDecoratorBox extends StatelessWidget {
  const _CustomDecoratorBox();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 20,
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppLayout.mainBodyRaidus),
          gradient:  LinearGradient(
        colors: [
        AppColors.mainColor,
        AppColors.secondColor,
      ])
        ),
      ),
    );
  }
}

class _CustomPopButton extends StatelessWidget {

  final TaskState state;

  const _CustomPopButton({required this.state});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      backgroundColor: AppColors.secondColor,
      onPressed: () {
        _deactivateCurrtenTask(context,state); 
        _pop(context);
      }, 
      icon: const Icon(Icons.arrow_back_ios_outlined, color: AppColors.whiteColor,));
  }

  void _pop(BuildContext context){
    FocusScope.of(context).unfocus();
    context.pop();
  }
   void _deactivateCurrtenTask(BuildContext context, TaskState state) {
    context.read<TaskBloc>().add(DeactivatedCurrrentTask());
  }
}


