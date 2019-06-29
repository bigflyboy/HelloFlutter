import 'package:flutter/material.dart';

///1.App首页框架搭建
///2.轮播图Banner功能开发
///3.自定义AppBar实现渐变效果

class SearchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }

}

class _SearchPageState extends State<SearchPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('搜索'),
      ),
    );
  }

}










