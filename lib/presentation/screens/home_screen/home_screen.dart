import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/presentation/animations/index.dart';
import 'package:task_app/presentation/screens/index.dart';
import 'package:task_app/presentation/shared/widgets/index.dart';
import 'package:task_app/presentation/state/tasks_bloc/task_bloc.dart';
import 'package:task_app/utils/enums/index.dart';
import 'package:task_app/utils/localizations/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  final quickAction = const QuickActions();

  @override
  void initState() {
    super.initState();
    initQuickActions();
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final state = context.watch<TaskBloc>().state;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        children: [

          FloatingActionButton(
            heroTag: "1",
            onPressed: 
          () {
            context.read<TaskBloc>().add(DeleteAllTasks());
            
          },
          
          
          ),


          FloatingActionButton(
            heroTag: "2",
            backgroundColor: AppColors.secondColor,
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppLayout.buttonFlagRadius)) ,
            child: const Icon(Icons.add,color: AppColors.whiteColor,),
            onPressed:()=> _goToNewTaskScreen(context),),
        ],
      ),
        body: SafeArea(
          child: Container(
            height: size.height,
            color: AppColors.mainColor,
            child: Column(
              children: [
                const CustomSpacer(
                  spacerEnum: SpacerEnum.spacingM,
                ),
                const CustomSelectionLanguage(),
                const Spacer(),
                CustomBodyContainer(
                  child: Column(
                    children: [
                      const CustomSpacer(
                        spacerEnum: SpacerEnum.spacingS,
                      ),
                      CustomFadeInAnimation(
                        child: Text(
                          Languages.of(context).labelWelcome,
                          style: AppFonts.fontStyle.copyWith(
                              color: AppColors.mainColor,
                              fontSize: AppFonts.fontSizeH1),
                        ),
                      ),
                      (state.existTasks == false ||
                        state.tasks == null ||
                        state.tasks!.isEmpty) ?
                        const CustomNoTaskWidget():
                      
                      const CustomListCards(),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ));
  }

  void _goToNewTaskScreen(BuildContext context){
    context.read<TaskBloc>().add(ActivatedTaskToEdit(taskToEdit: null));
    context.pushNamed(AppRoutesStrings.newTaskScreenRoute,extra: null);
  }
  
  // TODO:abstraer estos strings
  void initQuickActions() {
    quickAction.setShortcutItems([
      const ShortcutItem(type: "newTask", localizedTitle: "Create Task")
    
    ]);
    quickAction.initialize((type) {
      if(type == "newTask"){
        context.pushNamed(AppRoutesStrings.newTaskScreenRoute,extra:  null);
      }
    });
  }

}
