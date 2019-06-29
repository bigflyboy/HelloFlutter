import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'animation_study.dart';

///如何使用动画03
///AnimatedBuilder的使用
///将动画和widget分离
///1.显示logo
///2.定义Animation对象
///3.渲染过度效果

class AnimationPage03 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationPage03State();
}

class _AnimationPage03State extends State<AnimationPage03>
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
    return GrowTransition(animation: animation, child: LogWidget(),);
  }
}

class LogWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }

}

class GrowTransition extends StatelessWidget{

  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;


  @override
  Widget build(BuildContext context) {

    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
          height: animation.value,
          width: animation.value,
          child: child,
        ),
        child: child,
      ),
    );
  }


}
