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

class CustomAppbarOptions extends StatelessWidget {
  const CustomAppbarOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const CustomSpacer(spacerEnum: SpacerEnum.spacingS, isHorizontal: true,),
    
        CustomFadeInAnimation(child: Text("${Languages.of(context).appName}, ${Languages.of(context).labelWelcome}", style: AppFonts.fontStyle.copyWith(color: AppColors.whiteColor,fontSize: FontSizeEnum.h3.size),)),
        const Spacer(), 
        Align(
          alignment: Alignment.bottomCenter,
          child: const CustomCountTasks()),
        const Spacer(), 
        // TODO: si no voy a usar estas banderas eliminar también el paquete del ymal
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
    final TextStyle  font = AppFonts.fontStyle.copyWith(fontSize: FontSizeEnum.h3.size);

    await showMenu(
      context: context, 
      position:  const RelativeRect.fromLTRB(200, 50, 0, 100),
        items: [
        PopupMenuItem(
          onTap: () => _changeLanguage(context,AppString.spanishLanguage),
          value: 1,
          child: Text(Languages.of(context).labelLanguageSpanish,
            style: font,),
        ),
        PopupMenuItem(
          onTap: () => _changeLanguage(context,AppString.englishLanguage),
          value: 2,
          child: Text(Languages.of(context).labelLanguageEnglish, 
          style: font,),
        ),
      ],
    
    ).then((value) {
      if(value != null ){return;}

    });
  }
}
