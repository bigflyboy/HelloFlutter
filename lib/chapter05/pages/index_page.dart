import 'package:flutter/material.dart';
import 'package:flutter_app/chapter05/navigator/tab_navigator.dart';

///1.App首页框架搭建
///2.轮播图Banner功能开发
///3.自定义AppBar实现渐变效果

class IndexPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }

}

class _IndexPageState extends State<IndexPage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabNavigator(),
    );
  }

}










