import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/presentation/animations/index.dart';
import 'package:task_app/presentation/shared/widgets/index.dart';
import 'package:task_app/utils/enums/font_size_enum.dart';
import 'package:task_app/utils/enums/snack_bar_enum.dart';
import 'package:task_app/utils/enums/spacer_enum.dart';
import 'package:task_app/utils/localizations/index.dart';
import 'package:task_app/utils/shared_preferences/shared_preferences.dart';

class CustomSelectionLanguage extends StatelessWidget {
  const CustomSelectionLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const CustomSpacer(spacerEnum: SpacerEnum.spacingS, isHorizontal: true,),

        CustomFadeInAnimation(child: Text("${Languages.of(context).appName}, ${Languages.of(context).labelWelcome}", style: AppFonts.fontStyle.copyWith(color: AppColors.whiteColor,fontSize: FontSizeEnum.h3.size),)),
        const Spacer(), 
        const CustomCountTasks(),
        const Spacer(), 
        // CustomFlagButton(
        //   countryCode: FlagsCode.CO,
        //   onTap: () => _changeLanguage(context,AppString.spanishLanguage),
        // ),
        // const CustomSpacer(spacerEnum: SpacerEnum.spacingS, isHorizontal: true,),
        // CustomFlagButton(
        //   countryCode: FlagsCode.US,
        //   onTap: () => _changeLanguage(context,AppString.englishLanguage),
        // ),
        CustomIconButton(onPressed: () {
          _showMenuPopUp(context);
        }, icon: const Icon(Icons.more_vert_rounded,color: AppColors.whiteColor,)),
        const CustomSpacer(spacerEnum: SpacerEnum.spacingS, isHorizontal: true,),

      ],
    );
  }

  void _changeLanguage(BuildContext context,String language){
    changeLanguage(context, language);
    ShowSnackBar.showSnackBar(context, SnackBarEnum.info, Languages.of(context).labelLangaugeChanged);
  }

  void _showMenuPopUp(BuildContext context)async{

    final size = MediaQuery.of(context).size;

    await showMenu(
      context: context, 
      position:  const RelativeRect.fromLTRB(200, 50, 0, 100),
       items: [
        PopupMenuItem(
          onTap: () {
            
          },
          value: 1,
          child: const Text("ROHIT",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              color: Colors.green),),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text("REKHA", style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              color: Colors.green),),
        ),
        const PopupMenuItem(
          value: 3,
          child: Text("DHRUV", style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              color: Colors.green),),
        ),
      ],
    
    ).then((value) {
      if(value != null )
      print("value: $value");
    });
  }
}
