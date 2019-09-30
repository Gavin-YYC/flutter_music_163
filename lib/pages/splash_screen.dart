
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:music_163/common/utils.dart';
import 'package:music_163/common/const.dart';
import 'package:music_163/pages/home_screen.dart';


class SplashSreen extends StatefulWidget {
  final status;
  SplashSreen({Key key, this.status: WidgetStatus.LOGO}) : super(key: key);

  @override
  _SplashSreen createState() => new _SplashSreen();
}


class WidgetStatus {
  static const LOGO = 1;
  static const AD = 2;
  static const HOME = 3;
}


class _SplashSreen extends State<SplashSreen> {

  int status;

  Timer adTimer;

  int adDuration = 6;

  int LogoDuration = 2;

  bool hasAd = true;

  void initState() {
    super.initState();
    status = widget.status;
    changeWidgetStatus();
  }

  void changeWidgetStatus() {
    // 先展示自家LOGO
    new Timer(Duration(seconds: LogoDuration), () {
      setState(() => status = hasAd ? WidgetStatus.AD : WidgetStatus.HOME);

      // 广告倒计时
      if (hasAd) {
        adTimer = new Timer.periodic(Duration(seconds: 1), (timer) {
          if (adDuration < 1) {
            cancelAdTimer();
            return;
          }
          adDuration--;
        });
      }
    });
  }

  // 取消广告
  void cancelAdTimer() {
    setState(() => status = WidgetStatus.HOME);
    adTimer?.cancel();
  }

  Widget build(BuildContext context) {
    Size size = Utils.getClientSize(context);

    var adLayout = {
      'logoW': size.width,
      'logoH': size.height * 0.1034,
      'logoBg': Colors.white,
      'adW': size.width,
      'adH': size.height * (1 - 0.1034),
      'adBg': Colors.blue,
    };

    return Stack(
      children: <Widget>[
        // Logo
        Offstage(
          offstage: status != WidgetStatus.LOGO,
          child: Container(
            color: Utils.color(Constant.splashBg),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: size.height * 0.2624
                    ),
                    child: Text('音乐的力量', style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0
                    )),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: size.height * 0.0291
                    ),
                    child: Text('网易云音乐', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                    )),
                  ),
                ),
              ],
            )
          ),
        ),

        // 广告
        Offstage(
          offstage: status != WidgetStatus.AD,
          child: Container(
            color: Colors.green,
            child: Stack(
              children: <Widget>[
                // 广告内容
                Positioned(
                  top: 0,
                  left: 0,
                  width: adLayout['adW'],
                  height: adLayout['adH'],
                  child: Container(
                    color: adLayout['adBg'],
                    child: Text('广告内容'),
                  ),
                ),

                // 广告标志
                SafeArea(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      padding: EdgeInsets.only(left: 3.0, right: 3.0),
                      margin: EdgeInsets.only(top: 10.0, right: 25.0),
                      child: Text('广告', style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                      )),
                    ),
                  ),
                ),

                // 继续按钮
                Positioned(
                  right: 25.0,
                  bottom: size.height * 0.1294,
                  child: GestureDetector(
                    onTap: () => cancelAdTimer(),
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Text('跳过', style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0
                      )),
                    ),
                  ),
                ),

                // 底部logo
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: adLayout['logoBg'],
                    width: adLayout['logoW'],
                    height: adLayout['logoH'],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text('网易云音乐', style: TextStyle(
                              fontSize: 20.0
                          )),
                        ),
                        Text('网易公司版权所有 @2019', style: TextStyle(
                          fontSize: 16.0,
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // 首屏
        Offstage(
          offstage: status != WidgetStatus.HOME,
          child: HomeScreen(),
        ),
      ],
    );
  }
}
