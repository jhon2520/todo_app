import 'package:flutter/material.dart';
import 'package:task_app/config/layout/app_layout.dart';
import 'package:task_app/config/theme/app_colors.dart';


class CustomBodyContainer extends StatelessWidget {


  final Widget child;

  const CustomBodyContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.88,
      width: double.infinity,
      child: child,
      decoration: _customDecoration(),

    );
  }

  BoxDecoration _customDecoration() => BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(AppLayout.mainBodyRaidus),
      topRight: Radius.circular(AppLayout.mainBodyRaidus),
    )
  );
}