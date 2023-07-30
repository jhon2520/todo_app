import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/presentation/screens/new_task_screen.dart/widgets/index.dart';
import 'package:task_app/presentation/shared/widgets/index.dart';
import 'package:task_app/utils/index.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            Text(Languages.of(context).labelCreateTask,style: AppFonts.fontStyle.copyWith(
              fontSize: FontSizeEnum.h1.size
            ),),
            const FormNewTask(),
            const CustomSpacer(spacerEnum: 	SpacerEnum.spacingX),
            CustomPrimaryButton(
              onPressed: () {
                
              },
              label: Languages.of(context).labelSaveTask)
  
          ],
        ),
      )
    );
  }
}
