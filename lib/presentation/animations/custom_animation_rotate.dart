import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_app/config/index.dart';

class CustomAnimationRotate extends StatefulWidget {

  final Widget child;

  const CustomAnimationRotate({super.key, required this.child});

  @override
  State<CustomAnimationRotate> createState() => _CustomAnimationRotateState();
}

class _CustomAnimationRotateState extends State<CustomAnimationRotate>
    with SingleTickerProviderStateMixin {

    late AnimationController _controller;
    late Animation<double> _rotationAnimation;

    @override
    void initState() {
      _controller = AnimationController(
          vsync: this, duration: AppLayout.animationDuration);
      _rotationAnimation = Tween(begin: 0.0, end: pi * 2).animate(
          CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
      super.initState();
    }

    @override
    dispose() {
      _controller.dispose();
      super.dispose();
    }



  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(angle: _rotationAnimation.value, child:  widget.child,)  ;
      },
    );
  }
}
