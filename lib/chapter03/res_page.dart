import 'package:flutter/material.dart';

///如何使用资源文件

class ResPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ResPageState();
}

class _ResPageState extends State<ResPage>{

  String printString = '';

  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '如何使用资源文件',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何使用资源文件'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                width: 200,
                height: 200,
                image: AssetImage('images/ic_banner_pause.png'),
              )
            ],
          ),
        ),
      ),
    );;
  }

}





























