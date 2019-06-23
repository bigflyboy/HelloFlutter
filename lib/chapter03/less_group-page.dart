import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

///StatelessWidget与基础组件
///不依赖自身的状态来重新渲染自己
class LessGroupPage extends StatelessWidget {
  //
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextStyle style = new TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('StatelessWidget与基础组件'),),
        body: Container(
          decoration: BoxDecoration(color: Colors.red),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text('I am Text',
              style: style,),
              Icon(Icons.android,size: 50,color: Colors.limeAccent,),
              CloseButton(),
              BackButton(),
              Chip(
                avatar: Icon(Icons.people),
                label: Text('I am Chips'),
              ),
              Divider(
                height: 40,
                indent: 30,
                color: Colors.orange,
              ),
              Card(
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'I am card child',
                    style: style,
                  ),
                ),
              ),
              AlertDialog(
                title: Text('AlertDialog'),
                content: Text('你这个老头坏的很'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

