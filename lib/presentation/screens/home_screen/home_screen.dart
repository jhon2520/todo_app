import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/config/theme/app_colors.dart';
import 'package:task_app/presentation/animations/index.dart';
import 'package:task_app/presentation/screens/index.dart';
import 'package:task_app/presentation/shared/widgets/index.dart';
import 'package:task_app/utils/enums/index.dart';
import 'package:task_app/utils/localizations/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppLayout.buttonFlagRadius)) ,
        child: Icon(Icons.add,color: AppColors.whiteColor,),
        onPressed: () {
        
      },),
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
                      CustomListCards(),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ));
  }
}
