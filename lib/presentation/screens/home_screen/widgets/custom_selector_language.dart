import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/presentation/shared/widgets/index.dart';
import 'package:task_app/utils/enums/spacer_enum.dart';
import 'package:task_app/utils/shared_preferences/shared_preferences.dart';

class CustomSelectionLanguage extends StatelessWidget {
  const CustomSelectionLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomFlagButton(
          countryCode: FlagsCode.CO,
          onTap: () => changeLanguage(context, AppString.spanishLanguage),
        ),
        const CustomSpacer(spacerEnum: SpacerEnum.spacingS, isHorizontal: true,),
        CustomFlagButton(
          countryCode: FlagsCode.US,
          onTap: () => changeLanguage(context, AppString.englishLanguage),
        ),
      ],
    );
  }
}
