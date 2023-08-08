import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:task_app/config/index.dart';


class CustomLevelBoxIndicator extends StatefulWidget {

  final Color? color;

  const CustomLevelBoxIndicator({super.key,  this.color = AppColors.whiteColor});

  @override
  State<CustomLevelBoxIndicator> createState() => _CustomLevelBoxIndicatorState();
}

class _CustomLevelBoxIndicatorState extends State<CustomLevelBoxIndicator> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation _animationRotate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 5000))..repeat();
    _animationRotate = Tween(begin: 0.0,end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));


  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return AnimatedBuilder(
      animation: _controller,
      child: _Child(color: widget.color),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
        angle: _animationRotate.value * 2 * math.pi,
        child: child,
      ); 
      },
    );
  }
}

class _Child extends StatelessWidget {

  final Color? color;

  const _Child({
    super.key,
    this.color = AppColors.whiteColor
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppLayout.boxLevelIndicatorHeightWitdth,
      width: AppLayout.boxLevelIndicatorHeightWitdth,

      decoration: BoxDecoration(
        color:color,
        boxShadow: [
          BoxShadow(
            color: color ?? AppColors.whiteColor,
            offset: Offset(1, 1),
            spreadRadius: 1,
            blurRadius: 4
          )
        ],
        border: Border.all(
          color: AppColors.whiteColor
        )
      ),
    );
  }
}
