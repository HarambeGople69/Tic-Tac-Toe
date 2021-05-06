import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myapp/history_page.dart';
import 'package:myapp/playerVsComputer.dart';
import 'button_desgin.dart';
import 'playerVsPlayer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-4624789056859901/6179519443",
        listener: AdListener(),
        request: AdRequest())
      ..load();

    _interstitialAd = InterstitialAd(
        adUnitId: "ca-app-pub-4624789056859901/6343811609",
        listener: AdListener(),
        request: AdRequest())
      ..load();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Warning",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(85),
              ),
            ),
            content: Text(
              "Are you sure you want to exit?",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(65),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(50),
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "No",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(50),
                    ),
                  )),
            ],
          ),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          children: [
            Spacer(),
            Center(
              child: AvatarGlow(
                glowColor: Colors.white54,
                endRadius: ScreenUtil().setSp(420),
                duration: Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: Duration(milliseconds: 100),
                child: Material(
                  // elevation: 8.0,
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[800],
                    child: Image.asset(
                      'assets/image.png',
                      height: ScreenUtil().setHeight(800),
                      // height: 50,
                    ),
                    radius: ScreenUtil().setSp(300),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            // Text("Start"),
            GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return PlayerVsPlayer();
                // }));

                _ChooseMode();
              },
              child: button_design(
                string: "Start",
              ),
            ),
            // Text("History"),
            GestureDetector(
              onTap: () async {
                // _interstitialAd.show();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return History();
                }));
              },
              child: button_design(
                string: "History",
              ),
            ),
            // Text("Exit"),
            GestureDetector(
              onTap: () {
                SystemNavigator.pop();
              },
              child: button_design(
                string: "Exit",
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  _ChooseMode() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            title: Center(
                child: Text(
              "Choose your mode",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: ScreenUtil().setSp(70),
              ),
            )),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // _interstitialAd.show();

                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PlayerVsPlayer();
                    }));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: ScreenUtil().setSp(5),
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setSp(70),
                        )),
                    margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(30),
                      vertical: ScreenUtil().setSp(20),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(50),
                      vertical: ScreenUtil().setSp(20),
                    ),
                    child: Text(
                      "Player VS Player",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(50),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // _interstitialAd.show();

                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return playerVsComputer();
                    }));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: ScreenUtil().setSp(5),
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setSp(70),
                        )),
                    margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(50),
                      vertical: ScreenUtil().setSp(20),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(30),
                      vertical: ScreenUtil().setSp(20),
                    ),
                    child: Text(
                      "Player VS Computer",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(50),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
