import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

///如何使用图片

class ImagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage>{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '如何使用图片',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何使用图片'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: "http://via.placeholder.com/350x150",
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
              Icon(
                Icons.android,
                size: 100,
              )
            ],
          )
        ),
      ),
    );;
  }

}





























