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
      padding: EdgeInsets.symmetric(horizontal: AppLayout.spacingM, vertical: AppLayout.spacingS),
      width: double.infinity,
      height: AppLayout.heightCardsTaks,
      decoration: _CardDecoration(),
      child: _CardBodyWidget(),
    );
  }

  BoxDecoration _CardDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 1,
          blurRadius: 9,
          offset: Offset(2,3)
        ),
      ],
      color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(AppLayout.mainBodyRaidus)),
        border: Border.all(
          color: AppColors.borderCardsColors
        )
    );
  }
}

class _CardBodyWidget extends StatelessWidget {
  const _CardBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(  Languages.of(context).labelTask, style: AppFonts.fontStyle,),
        Text(  Languages.of(context).labelDeadline, style: AppFonts.fontStyle,),
        Text(  Languages.of(context).labelLevel, style: AppFonts.fontStyle,),
        _CardButtonsWidget()
      ],
    );
  }
}

class _CardButtonsWidget extends StatelessWidget {
  const _CardButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        CustomIconButton(onPressed: () {

        }, icon: Icon(Icons.edit_square,color: AppColors.mainColor,)),

        CustomSpacer(spacerEnum: SpacerEnum.spacingS,isHorizontal: true,),

        CustomIconButton(onPressed: () {

        }, icon: Icon(Icons.delete,color: AppColors.mainColor)),


      ],
    );
  }
}