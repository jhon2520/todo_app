import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/presentation/screens/home_screen/index.dart';

class CustomListCards extends StatelessWidget {
  const CustomListCards({super.key});

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.7,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: AppLayout.spacingM),
          itemBuilder: (context, index) {
            return CustomTaskCard();
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: AppColors.mainColor,
            );
          },
          itemCount: 8),
    );
  }
}
