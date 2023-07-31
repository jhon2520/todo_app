import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';

class CustomIconButton extends StatelessWidget {

  final void Function()? onPressed;
  final Color? backgroundColor;
  final Icon icon;

  const CustomIconButton({super.key, 
  required this.onPressed, required this.icon, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor ?? AppColors.mainColor.withOpacity(0.2),
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}