import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

///1.App首页框架搭建
///2.轮播图Banner功能开发
///3.自定义AppBar实现渐变效果

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

const APPBAR_SCROLL_OFFSET = 100;

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561809227858&di=75db97e6bc4e43e1d84466f657c2024e&imgtype=0&src=http%3A%2F%2Fpic41.nipic.com%2F20140508%2F18609517_112216473140_2.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561809227856&di=c5408e3a1f76630f3fb82515d38b63a7&imgtype=0&src=http%3A%2F%2Fpic25.nipic.com%2F20121117%2F9252150_165726249000_2.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1561809227856&di=846080282543ab1f8fbad17ffc27a0f1&imgtype=0&src=http%3A%2F%2Fpic36.nipic.com%2F20131126%2F8821914_071759099000_2.jpg'
  ];

  double appBarAlpha = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  _onSroll(scrollNotification.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          _imageUrls[index],
                          fit: BoxFit.fill,
                        );
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),
                  Container(
                    height: 800,
                    child: ListTile(title: Text('哈哈')),
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onSroll(double offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }
}
