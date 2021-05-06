import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myapp/databaseHelper.dart';
import 'package:myapp/homepage.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  InterstitialAd _interstitialAd;
  BannerAd _bannerAd;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _interstitialAd = InterstitialAd(
        adUnitId: "ca-app-pub-4624789056859901/6343811609",
        listener: AdListener(),
        request: AdRequest())
      ..load();

    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-4624789056859901/6179519443",
        listener: AdListener(),
        request: AdRequest())
      ..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(220)),
        child: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, size: ScreenUtil().setSp(120)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              }),
          title: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'History',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(90),
                ),
              )),
          centerTitle: true,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
            Expanded(
              child: FutureBuilder(
                  initialData: [],
                  future: DatabaseHelper.instance.queryAll(),
                  builder: (context, snapshot) {
                    return (snapshot.data.length != null)
                        ? ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(25),
                                    vertical: ScreenUtil().setHeight(25)),
                                elevation: 4,
                                child: ListTile(
                                  trailing: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: ScreenUtil().setSp(80),
                                      ),
                                      onPressed: () {
                                        DatabaseHelper.instance.delete(
                                            snapshot.data[index]["_id"]);
                                        _interstitialAd.show();

                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return History();
                                        }));
                                      }),
                                  title: Text(
                                    "${snapshot.data[index]["status"]}",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(55),
                                    ),
                                  ),
                                  subtitle: Text(
                                    "${snapshot.data[index]["name"]}",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(45),
                                    ),
                                  ),
                                ),
                              );
                            })
                        : Container();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
