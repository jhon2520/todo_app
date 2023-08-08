import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/domain/models/index.dart';
import 'package:task_app/presentation/shared/widgets/index.dart';
import 'package:task_app/presentation/state/tasks_bloc/task_bloc.dart';
import 'package:task_app/utils/enums/index.dart';
import 'package:task_app/utils/formats/formats_utils.dart';
import 'package:task_app/utils/localizations/index.dart';
import 'dart:math' as math;

class CustomTaskCard extends StatelessWidget {

  final TaskModel? task;

  const CustomTaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppLayout.spacingM, vertical: AppLayout.spacingS),
      width: double.infinity,
      height: AppLayout.heightCardsTaks,
      decoration: _cardDecoration(),
      child: _CardBodyWidget(task: task),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: AppColors.cardsShade,
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(1,2)
        ),
      ],
      color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(AppLayout.mainBodyRaidus)),
        border: Border.all(
          color: AppColors.borderCardsColors
        )
    );
  }
}

class _CardBodyWidget extends StatelessWidget {

  final TaskModel? task;

  const _CardBodyWidget({required this.task});

  @override
  Widget build(BuildContext context) {

    final TextStyle  fontBold = AppFonts.fontStyle.copyWith(fontWeight: FontWeight.bold, fontSize: FontSizeEnum.h3.size);
    final TextStyle  font = AppFonts.fontStyle.copyWith(fontSize: FontSizeEnum.h3.size);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(Languages.of(context).labelTask, style: fontBold ,maxLines: 1,overflow: TextOverflow.clip,),
            Text(" ${task?.taksName ?? ""}", style: font,maxLines: 1,overflow: TextOverflow.clip,),
          ],
        ),
        Row(
          children: [
            Text(Languages.of(context).labelDeadline, style: fontBold,),
            Text(" ${FormatsUtils.formatDates(task?.deadLine)}", style: font,),
          ],
        ),
        Row(
          children: [
            Text(  Languages.of(context).labelLevel, style:fontBold,),
            Text(  " ${_validateLevel(context,task!)}", style: font),
            const CustomSpacer(spacerEnum: SpacerEnum.spacingS,isHorizontal: true,),
            CustomLevelBoxIndicator(color: task?.levelColor),
          ],
        ),
        _CardButtonsWidget(task: task)
      ],
    );
  }

    String _validateLevel(BuildContext context, TaskModel task){
 
    switch (task.level) {
      case LevelTaskEnum.high:
        return Languages.of(context).labelLevelHigh;        
      case LevelTaskEnum.medium:
        return Languages.of(context).labelLevelMedium;        
      case LevelTaskEnum.low:
        return Languages.of(context).labelLevelLow;        
      default:
      return "";
    }
  }
}


class _CardButtonsWidget extends StatelessWidget {

  final TaskModel? task;

  const _CardButtonsWidget({required this.task});

  @override
  Widget build(BuildContext context) {

    final state = context.watch<TaskBloc>().state;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        CustomIconButton(onPressed: ()=>_editTaks(context,state)
        , icon: const Icon(Icons.edit_square,color: AppColors.mainColor,)),

        const CustomSpacer(spacerEnum: SpacerEnum.spacingS,isHorizontal: true,),

        CustomIconButton(
          onPressed: () => _deleteTask(context,state),
          icon: const Icon(Icons.delete,color: AppColors.errorColor)),


      ],
    );
  }

  void _deleteTask(BuildContext context, TaskState state){
    context.read<TaskBloc>().add(DeletedTaskEvent(
      idToDelete: task?.id
    ));
  }

  void _editTaks(BuildContext context,TaskState state){

    context.read<TaskBloc>().add(ActivatedTaskToEdit(
      taskToEdit: task
    ));
    context.pushNamed(AppRoutesStrings.newTaskScreenRoute,extra: task);
  }
}