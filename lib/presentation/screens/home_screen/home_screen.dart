import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) => Scaffold(
          body: SafeArea(
            child: Container(
              color: AppColors.mainColor,
              child: Column(
                children: [
                  const CustomSpacer(
                    spacerEnum: SpacerEnum.spacingM,
                  ),
                      
                  const CustomSelectionLanguage(),
                  Spacer(),
                      
                      
                  CustomBodyContainer(
                      child: Column(
                    children: [
                  const CustomSpacer(
                    spacerEnum: SpacerEnum.spacingS,
                  ),
                      
                  CustomFadeInAnimation(
                    child: Text(
                      Languages.of(context).labelWelcome,
                      style: const TextStyle(fontSize: 20, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                    ],
                  )),
                ],
              ),
            ),
          ));
}
