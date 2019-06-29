import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

///如何使用动画
///1.在flutter中有哪些类型的动画
/// tween补间动画 物理动画
///2.如何使用动画库中的基础类给widget添加动画
/// ～Animation 核心库
/// ~CurvedAnimation
/// ~AnimationController 管理动画 启动动画 倒放动画 重置动画
/// ~Tween 生成从红到蓝的色值 生成不同区间范围的映射
/// Animation是一个在一段时间内依次生成一个区间之间值的类 有状态，可以访问其value值 和ui渲染没有关系
/// CurvedAnimation将动画定义为一个非线性曲线
///3.如何为动画添加监听器
///4.什么时候使用animatedWidget和AnimatedBuilder
///5.如何使用Hero动画

class AnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;

  double animationValue;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          animationValue = animation.value;
        });
      })
      ..addStatusListener((AnimationStatus state) {
        setState(() {
          animationStatus = state;
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  controller.reset();
                  controller.forward();
                },
                child: Text(
                  'State',
                  style: TextStyle(fontSize: 20),
                  textDirection: TextDirection.ltr,
                ),
              ),
              Text(
                'State:' + animationStatus.toString(),
                style: TextStyle(fontSize: 20),
                textDirection: TextDirection.ltr,
              ),
              Text(
                'Value:' + animationValue.toString(),
                style: TextStyle(fontSize: 20),
                textDirection: TextDirection.ltr,
              ),
              Container(
                height: animation.value,
                width: animation.value,
                child: FlutterLogo(),
              )
            ],
          ),
        ),
    );
  }
}

class AnimatedLogo extends AnimatedWidget{

  AnimatedLogo({Key key, Animation<double> animation})
      :super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }

}