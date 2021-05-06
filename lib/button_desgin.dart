import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class button_design extends StatelessWidget {
  final String string;

  const button_design({Key key, this.string}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtil().setSp(30)),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20),
        vertical: ScreenUtil().setHeight(20),
      ),
      // width: 500,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        border: Border.all(
          width: ScreenUtil().setSp(8),
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(ScreenUtil().setSp(75)),
      ),
      child: Center(
        child: Text(
          string,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(85),
          ),
        ),
      ),
    );
  }
}
