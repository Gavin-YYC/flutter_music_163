import 'package:flutter/material.dart';
import 'package:music_163/pages/splash_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  MyApp({Key key}): super(key: key);

  @override
  _MyAppState createState() => new _MyAppState();
}


class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: '网易云音乐',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SplashSreen(),
      ),
    );
  }
}