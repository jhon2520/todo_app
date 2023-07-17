import 'package:flutter/material.dart';
import 'package:task_app/utils/enums/index.dart';


class CustomSpacer extends StatelessWidget {


  final SpacerEnum spacerEnum;
  final bool isHorizontal;

  const CustomSpacer({super.key, required this.spacerEnum, this.isHorizontal = false});

  @override
  Widget build(BuildContext context) {

    if(isHorizontal){
      return SizedBox(
        width:spacerEnum.size ,
      );
    }
    return SizedBox(
      height: spacerEnum.size ,
    );
  }
}