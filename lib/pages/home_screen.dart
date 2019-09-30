import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网易云音乐'),
      ),
      body: new ListView(
        children: <Widget>[
          Text('banner'),
          Text('icons'),
          Text('推荐歌单'),
          Text('新碟'),
          Text('云村精选'),
          Text('无限下拉')
        ],
      ),
    );
  }
}