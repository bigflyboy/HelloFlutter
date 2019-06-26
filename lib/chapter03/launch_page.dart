import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

///如何打开第三方应用

class LaunchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage>{

  String printString = '';

  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '如何打开第三方应用',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何打开第三方应用'),
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
              RaisedButton(
                onPressed: () => _launchURL(),
                child: Text('打开浏览器'),
              )
            ],
          ),
        ),
      ),
    );;
  }

  _launchURL() async {
    const url = 'https://www.baidu.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}





























