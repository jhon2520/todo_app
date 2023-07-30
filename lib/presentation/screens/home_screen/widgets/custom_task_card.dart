import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/presentation/shared/widgets/index.dart';
import 'package:task_app/utils/enums/index.dart';
import 'package:task_app/utils/localizations/index.dart';

class CustomTaskCard extends StatelessWidget {
  const CustomTaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppLayout.spacingM, vertical: AppLayout.spacingS),
      width: double.infinity,
      height: AppLayout.heightCardsTaks,
      decoration: _cardDecoration(),
      child: const _CardBodyWidget(),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: AppColors.cardsShade,
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(1,2)
        ),
      ],
      color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(AppLayout.mainBodyRaidus)),
        border: Border.all(
          color: AppColors.borderCardsColors
        )
    );
  }
}

class _CardBodyWidget extends StatelessWidget {
  const _CardBodyWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(  Languages.of(context).labelTask, style: AppFonts.fontStyle,),
        Text(  Languages.of(context).labelDeadline, style: AppFonts.fontStyle,),
        Text(  Languages.of(context).labelLevel, style: AppFonts.fontStyle,),
        const _CardButtonsWidget()
      ],
    );
  }
}

class _CardButtonsWidget extends StatelessWidget {
  const _CardButtonsWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        CustomIconButton(onPressed: () {

        }, icon: const Icon(Icons.edit_square,color: AppColors.mainColor,)),

        const CustomSpacer(spacerEnum: SpacerEnum.spacingS,isHorizontal: true,),

        CustomIconButton(onPressed: () {

        }, icon: const Icon(Icons.delete,color: AppColors.mainColor)),


      ],
    );
  }
}