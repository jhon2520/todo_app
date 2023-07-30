import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/presentation/screens/home_screen/index.dart';

class CustomListCards extends StatelessWidget {
  const CustomListCards({super.key});

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.75,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            // stops: [0,0.6,0.1],
         begin: Alignment.bottomRight,
            end: Alignment.topRight,
            colors: <Color>[
              Color.fromARGB(73, 0, 0, 0),
              Colors.white,
              Color.fromARGB(130, 158, 158, 158)
            ],
          
          
          ).createShader(bounds);
        },
         blendMode: BlendMode.dstIn,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: AppLayout.spacingM, vertical:  AppLayout.spacingS),
            itemBuilder: (context, index) {
              return const CustomTaskCard();
            },
            separatorBuilder: (context, index) {
              return Divider(
            
                indent: AppLayout.identDivider,
                endIndent: AppLayout.identDivider,
                color: AppColors.mainColor.withOpacity(0.1),
              );
            },
            itemCount: 8),
      ),
    );
  }
}
