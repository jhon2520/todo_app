import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/presentation/state/tasks_bloc/task_bloc.dart';
import 'package:task_app/utils/enums/font_size_enum.dart';


class CustomCountTasks extends StatelessWidget {
  const CustomCountTasks({super.key});

  @override
  Widget build(BuildContext context) {

    final TaskState  state = context.watch<TaskBloc>().state;

    if(state.tasks == null || state.tasks!.isEmpty){
      return const SizedBox.shrink();
    }else{
      return Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(Icons.warning,color: AppColors.whiteColor,),
          Positioned(
            left: -2,
            top: -8,
            child: Container(
              alignment: Alignment.center,
              height: AppLayout.customCountTasksRadius,
              width: AppLayout.customCountTasksRadius,
              decoration: _customDecoration(),
              child: Text( state.tasks!.length > 9 ? "9+" : state.tasks!.length.toString(), 
              style: AppFonts.fontStyle.copyWith(
                fontSize: FontSizeEnum.h5.size,
                color: AppColors.whiteColor),),
            ),
          ),
    
        ],
      );
    }

    
  }

  BoxDecoration _customDecoration() => BoxDecoration(
    color: AppColors.colorCircleCountTask,
    shape: BoxShape.circle,
    border: Border.all(
      color: AppColors.whiteColor
    )
  );
}