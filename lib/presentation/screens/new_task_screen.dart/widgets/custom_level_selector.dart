import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/data/models/index.dart';
import 'package:task_app/presentation/shared/widgets/index.dart';
import 'package:task_app/utils/index.dart';
import 'package:task_app/presentation/state/tasks_bloc/task_bloc.dart';

class CustomLevelSelector extends StatelessWidget {
  const CustomLevelSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      height: AppLayout.heightFormFields,
      padding: const EdgeInsets.symmetric(horizontal: AppLayout.spacingM),
      decoration: _customDecoration(),
      child: const _BodyCustomLevelSelector(),
    );
  }

  BoxDecoration _customDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: AppColors.borderFieldsColor
      ),
      borderRadius: BorderRadius.circular(AppLayout.mainBodyRaidus),
      color: AppColors.whiteColor,
        boxShadow: const[
          BoxShadow(
            color: AppColors.cardsShade,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(1,2)

          )
        ]

    );
  }
}

class _BodyCustomLevelSelector extends StatelessWidget {
  const _BodyCustomLevelSelector();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TaskBloc>().state;

    return Row(
      children: [

        Text("${Languages.of(context).labelLevel} ${_validateLevel(context, state)}", style: AppFonts.fontStyle,),
        const Spacer(),

        const _LevelSelector()

      ]
    );
  }

  String _validateLevel(BuildContext context, TaskState state){

    if(state.activeTask == null){
      return Languages.of(context).labelSelectOne;
    }
 
    switch (state.activeTask!.level) {
      case LevelTaskEnum.high:
        return Languages.of(context).labelLevelHigh;        
      case LevelTaskEnum.medium:
        return Languages.of(context).labelLevelMedium;        
      case LevelTaskEnum.low:
        return Languages.of(context).labelLevelLow;        
      default:
      return Languages.of(context).labelSelectOne;
    }
  }
}

class _LevelSelector extends StatelessWidget {
  const _LevelSelector();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _ItemSelector(
          levelTaskEnum: LevelTaskEnum.low,
          color: AppColors.colorLowLevel,
        ),
        CustomSpacer(spacerEnum: SpacerEnum.spacingM,isHorizontal: true,),
        _ItemSelector(
          levelTaskEnum: LevelTaskEnum.medium,
          color: AppColors.colorMediumLevel,
        ),
        CustomSpacer(spacerEnum: SpacerEnum.spacingM,isHorizontal: true,),
        _ItemSelector(
          levelTaskEnum: LevelTaskEnum.high,
          color: AppColors.colorHighLevel,
        ),
        CustomSpacer(spacerEnum: SpacerEnum.spacingM,isHorizontal: true,),

      ],
    );
  }
}

class _ItemSelector extends StatelessWidget {

  final Color color;
  final LevelTaskEnum levelTaskEnum;

  const _ItemSelector({required this.color, required this.levelTaskEnum});

  @override
  Widget build(BuildContext context) {

    final state = context.watch<TaskBloc>().state;

    return GestureDetector(
      onTap: () =>_activateColorCurrentTask(context,state, color),
      child: Container(
        height: AppLayout.heightLevelSelector ,
        width: AppLayout.heightLevelSelector ,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: state.activeTask?.level == levelTaskEnum ? color : AppColors.whiteColor,
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(1,1)
            )
          ],
          color: color,
          shape: BoxShape.circle
        ),
      ),
    );
  }

  void _activateColorCurrentTask(BuildContext context, TaskState state,Color color) {
    final TaskModel activeTask = TaskModel();

    context.read<TaskBloc>().add(ActivadedCurrentTaks(
        newActiveTask: state.activeTask == null
            ? activeTask.copyWith(level: levelTaskEnum,levelColor: color)
            : state.activeTask?.copyWith(level: levelTaskEnum, levelColor: color)));
  }
}