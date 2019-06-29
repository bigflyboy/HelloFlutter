import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'animation_study.dart';

///如何使用动画02
///AnimatedWidget的使用

class AnimationPage02 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationPage02State();
}

class _AnimationPage02State extends State<AnimationPage02>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation: animation);
  }
}
