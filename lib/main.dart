import 'package:flutter/material.dart';

import 'chapter03/flutter_layout_page.dart';
import 'chapter03/gesture_listen_page.dart';
import 'chapter03/launch_page.dart';
import 'chapter03/less_group-page.dart';
import 'chapter03/res_page.dart';
import 'chapter03/stateful_group_page.dart';
import 'chapter04/animation_study.dart';
import 'chapter04/animation_study_02.dart';
import 'chapter04/animation_study_03.dart';
import 'chapter04/image_study.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('使用flutter路由'),
        ),
        body: RouteNavigator(),
      ),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StatefulGroup(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'gesture': (BuildContext context) => GesturePage(),
        'res': (BuildContext context) => ResPage(),
        'urlluanch': (BuildContext context) => LaunchPage(),
        'image': (BuildContext context) => ImagePage(),
        'animation': (BuildContext context) => AnimationPage(),
        'animation02': (BuildContext context) => AnimationPage02(),
        'animation03': (BuildContext context) => AnimationPage03(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  RouteNavigator({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  int _counter = 0;
  bool byName = false;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
      child: ListView(children: <Widget>[
        SwitchListTile(
          title: Text('${byName?'':'不'}通过路由'),
          value: byName,
          onChanged: (value){
            setState(() {
              byName = value;
            });
          },
        ),
        _item('statelessWidget基础组件', LessGroupPage(), 'less'),
        _item('statefulWidget基础组件', StatefulGroup(), 'ful'),
        _item('layout布局', FlutterLayoutPage(), 'layout'),
        _item('手势监听', GesturePage(), 'gesture'),
        _item('如何使用资源文件', ResPage(), 'res'),
        _item('如何打开第三方应用', LaunchPage(), 'urlluanch'),
        _item('如何使用图片', ImagePage(), 'image'),
        _item('如何使用动画', AnimationPage(), 'animation'),
        _item('如何使用动画02', AnimationPage02(), 'animation02'),
        _item('如何使用动画03', AnimationPage03(), 'animation03'),
      ]),
    );
  }

  _item(String string, lessGroupPage, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if(byName){
            Navigator.pushNamed(context, routeName);
          }else{
            Navigator.push(context, MaterialPageRoute(builder: (context)=>lessGroupPage));
          }
        },
        child: Text(string),
      ),
    );
  }
}
