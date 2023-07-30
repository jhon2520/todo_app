import 'package:flutter/material.dart';
import 'package:task_app/config/layout/app_layout.dart';

class CustomFadeInAnimation extends StatefulWidget {

  final Widget child;

  const CustomFadeInAnimation({super.key, required this.child});

  @override
  State<CustomFadeInAnimation> createState() => _CustomFadeInTransitionState();
}

class _CustomFadeInTransitionState extends State<CustomFadeInAnimation> with SingleTickerProviderStateMixin{


  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: AppLayout.animationDuration);
    animation = Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
    
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: animation.value,
          child: widget.child,
        ) ;
      },
    );
  }
}