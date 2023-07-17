import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:task_app/config/layout/app_layout.dart';

class CustomFlagButton extends StatelessWidget {

  final Function()? onTap;
  final FlagsCode countryCode;

  const CustomFlagButton({super.key, 
  required this.countryCode,
  required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Flag.fromCode(
        countryCode,
        height: AppLayout.buttonFlagRadius,
        width: AppLayout.buttonFlagRadius,
        borderRadius: AppLayout.buttonFlagRadius,
        flagSize: FlagSize.size_1x1,
      ),
    );
  }
}
