import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/presentation/shared/widgets/custom_spacer.dart';
import 'package:task_app/utils/enums/spacer_enum.dart';
import 'package:task_app/utils/localizations/languages.dart';

class CustomLevelSelector extends StatelessWidget {
  const CustomLevelSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppLayout.heightFormFields,
      padding: const EdgeInsets.symmetric(horizontal: AppLayout.spacingM),
      decoration: _customDecoration(),
      child: const _BodyCustomLevelSelector(),
    );
  }

  BoxDecoration _customDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: AppColors.secondColor
      ),
      borderRadius: BorderRadius.circular(AppLayout.mainBodyRaidus),
      color: AppColors.whiteColor,

    );
  }
}

class _BodyCustomLevelSelector extends StatelessWidget {
  const _BodyCustomLevelSelector();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Text(Languages.of(context).labelLevel, style: AppFonts.fontStyle,),
        const Spacer(),
        const _LevelSelector()

      ]
    );
  }
}

class _LevelSelector extends StatelessWidget {
  const _LevelSelector();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: const [
          _ItemSelector(
            color: AppColors.colorLowLevel,
          ),
          CustomSpacer(spacerEnum: SpacerEnum.spacingM,isHorizontal: true,),
          _ItemSelector(
            color: AppColors.colorMediumLevel,
          ),
          CustomSpacer(spacerEnum: SpacerEnum.spacingM,isHorizontal: true,),
          _ItemSelector(
            color: AppColors.colorHighLevel,
          ),
          CustomSpacer(spacerEnum: SpacerEnum.spacingM,isHorizontal: true,),

        ],
      ),
    );
  }
}

class _ItemSelector extends StatelessWidget {

  final Color color;

  const _ItemSelector({required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        height: AppLayout.heightLevelSelector ,
        width: AppLayout.heightLevelSelector ,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: color,
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(1,1)
            )
          ],
          color: color,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}