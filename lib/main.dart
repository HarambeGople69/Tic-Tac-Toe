import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'homepage.dart';

void main() {
  // DevicePreview(
  //   builder: (context) => MyApp(), // Wrap your app
  // );
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return ScreenUtilInit(
        designSize: Size(1080, 1920),
        builder: () => MaterialApp(
              // locale: DevicePreview.locale(context), // Add the locale here
              // builder: DevicePreview.appBuilder,
              // locale: DevicePreview.locale(context),
              // builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              title: "Tic Tac Toe",
              home: HomePage(),
              theme: ThemeData.dark(),
            ));
  }   
}
