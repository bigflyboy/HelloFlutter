import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///本节内容
///1.基于http实现网络操作
///2.异步：Future和FutureBuilder实用技巧
///3.JSON解析与复杂模型转换实用技巧
///4.基于shared_preferences本地存储操作

class NetPage extends StatefulWidget {
  @override
  _NetPageState createState() {
    return _NetPageState();
  }
}

class _NetPageState extends State<NetPage> {
  String showResult = '';

  Future<CommonModel> fetchPost() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    final result = json.decode(response.body);
    return CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Http'),
        ),
        body: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                fetchPost().then((CommonModel value) {
                  setState(() {
                    showResult =
                        '请求结果：\nhideAppBar:${value.hideAppbar}\nicon:${value.icon}';
                  });
                });
              },
              child: Text(
                '点我',
                style: TextStyle(fontSize: 26),
              ),
            ),
            Text(showResult),
          ],
        ),
      ),
    );
  }
}

class FuturePage extends StatefulWidget {
  @override
  _FuturePageState createState() {
    return _FuturePageState();
  }
}

class _FuturePageState extends State<FuturePage> {
  Future<CommonModel> fetchPost() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    Utf8Decoder utf8decoder = Utf8Decoder(); //fix 中文乱码
    final result = json.decode(utf8decoder.convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Future使用教程'),
        ),
        body: FutureBuilder<CommonModel>(
            future: fetchPost(),
            builder:
                (BuildContext context, AsyncSnapshot<CommonModel> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Input start');
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                  return Text('');
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return Text(
                        'FutureBuilder请求结果：\nhideAppBar:${snapshot.data.hideAppbar}\n'
                            'icon:${snapshot.data.icon}\n'
                            'title:${snapshot.data.title}');
                  }
              }
            }),
      ),
    );
  }
}

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppbar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppbar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppbar: json['hideAppbar'],
    );
  }
}

///1.json序列化方式
///2.提高json解析效率
