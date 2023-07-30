import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/presentation/animations/index.dart';
import 'package:task_app/presentation/shared/widgets/index.dart';
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

        CustomFadeInAnimation(child: Text(Languages.of(context).appName, style: const TextStyle(color: AppColors.whiteColor),)),
        const Spacer(), 

        CustomFlagButton(
          countryCode: FlagsCode.CO,
          onTap: () => _changeLanguage(context,AppString.spanishLanguage),
        ),
        const CustomSpacer(spacerEnum: SpacerEnum.spacingS, isHorizontal: true,),
        CustomFlagButton(
          countryCode: FlagsCode.US,
          onTap: () => _changeLanguage(context,AppString.englishLanguage),
        ),
        const CustomSpacer(spacerEnum: SpacerEnum.spacingS, isHorizontal: true,),

      ],
    );
  }

  void _changeLanguage(BuildContext context,String language){
    changeLanguage(context, language);
    ShowSnackBar.showSnackBar(context, SnackBarEnum.info, Languages.of(context).labelLangaugeChanged);
  }
}
