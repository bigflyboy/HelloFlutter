import 'package:flutter/material.dart';

///如何监听用户的手势和处理点击事件

class GesturePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage>{

  String printString = '';

  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '如何监听用户的手势和处理点击事件',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何监听用户的手势和处理点击事件'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: ()=>_printMsg('点击'),
                    onDoubleTap: ()=>_printMsg('双击'),
                    onLongPress: ()=>_printMsg('长按'),
                    onTapCancel: ()=>_printMsg('取消'),
                    onTapDown: (e)=>_printMsg('按下'),
                    onTapUp: (e)=>_printMsg('松开'),
                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Text('点我', style: TextStyle(fontSize: 36, color: Colors.white),),
                    ),
                  ),
                  Text(printString),
                ],
              ),
              Positioned(
                left: x,
                top: y,
                child: GestureDetector(
                  onPanUpdate: (e)=> _doMove(e),
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(36),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );;
  }

  _printMsg(String s) {
    setState(() {
      printString += ' ,$s';
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      x += e.delta.dx;
      y +=e.delta.dy;
    });
  }

}














