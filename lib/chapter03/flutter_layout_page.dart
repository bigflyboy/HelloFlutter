import 'package:flutter/material.dart';

///布局相关组件
///
/// 1.Container
/// 2.RenderObjectWidget
/// 2.1 SingleChildRenderObjectWidget
/// 2.1.1 Opacity 改变透明度
/// 2.1.2 ClipOval 裁剪成圆形
/// 2.1.3 ClipRRect 裁剪成方形
/// 2.1.4 PhysicalModel 将布局显示成不同形状
/// 2.1.5 Align Center 居中
/// 2.1.6 Padding
/// 2.1.7 SizedBox
/// 2.1.8 FractionallySizedBox 约束布局
/// 2.2 MultiChildRenderObjectWidget
/// 2.2.1 Stack 相当于Android的framelayout
/// 2.2.2 Flex
/// 2.2.2.1 Column 垂直布局
/// 2.2.2.2 Row 水平
/// 2.2.3 Wrap 可以换行
/// 2.2.4 Flow
/// 3 ParentDataWidget
/// 3.1 Positioned
/// 3.2 Flexible Expanded
///

/// 如何进行flutter布局开发
class FlutterLayoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlutterLayoutPageState();
  }
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle style = new TextStyle(fontSize: 20);
    return MaterialApp(
      title: '如何进行flutter布局开发',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何进行flutter布局开发'),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                title: Text('首页'),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.list,
                  color: Colors.blue,
                ),
                title: Text('列表'),
              )
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        body: (_currentIndex == 0)
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Image.network(
                      'http://pic37.nipic.com/20140113/8800276_184927469000_2.png',
                      width: 300,
                      height: 200,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        hintText: '请输入',
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        FractionallySizedBox(
                          widthFactor: 1,
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                            ),
                            child: Text('宽度充满'),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Image.network(
                          'http://pic37.nipic.com/20140113/8800276_184927469000_2.png',
                          width: 100,
                          height: 100,
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Image.network(
                            'http://pic37.nipic.com/20140113/8800276_184927469000_2.png',
                            width: 36,
                            height: 36,
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: <Widget>[
                        _chip('Flutter1'),
                        _chip('Flutter2'),
                        _chip('Flutter3'),
                        _chip('Flutter4'),
                        _chip('Flutter5'),
                        _chip('Flutter6'),
                      ],
                    ),
                    Container(
                      height: 100,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(color: Colors.lightBlueAccent),
                      child: PageView(
                        children: <Widget>[
                          _item('Page1', Colors.deepPurple),
                          _item('Page2', Colors.green),
                          _item('Page3', Colors.red),
                        ],
                      ),
                    )
                  ],
                ),
                onRefresh: _handleRefresh,
              )
            : Text('liebiao'),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  _item(String s, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        s,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  _chip(String laber) {
    return Chip(
      label: Text(laber),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          laber.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
