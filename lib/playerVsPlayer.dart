import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'databaseHelper.dart';

class PlayerVsPlayer extends StatefulWidget {
  @override
  _PlayerVsPlayerState createState() => _PlayerVsPlayerState();
}

class _PlayerVsPlayerState extends State<PlayerVsPlayer> {
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

  List<String> changeXO = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  // ignore: non_constant_identifier_names
  int OScore = 0;
  // ignore: non_constant_identifier_names
  int XScore = 0;

  // ignore: non_constant_identifier_names
  bool Xturn = true; //The first player is X
  int filledbox = 0;

  change(int index) {
    setState(() {
      if (Xturn && changeXO[index] == "") {
        changeXO[index] = "X";
        filledbox += 1;
        Xturn = !Xturn;
      } else if (!Xturn && changeXO[index] == "") {
        changeXO[index] = "O";
        filledbox += 1;
        Xturn = !Xturn;
      }
      _checkWinner();
    });
  }

  _checkWinner() async {
    // First row
    if (changeXO[0] == changeXO[1] &&
        changeXO[0] == changeXO[2] &&
        changeXO[0] != "") {
      if (changeXO[0] == "X") {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$FirstPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      } else {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$SecondPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      }
      _interstitialAd.show();
      _showWinDialog(changeXO[0]);
    } else if (
        // Second row
        changeXO[3] == changeXO[4] &&
            changeXO[3] == changeXO[5] &&
            changeXO[3] != "") {
      if (changeXO[3] == "X") {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$FirstPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      } else {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$SecondPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      }
      _interstitialAd.show();
      _showWinDialog(changeXO[3]);
    } else if (
        // Third row
        changeXO[6] == changeXO[7] &&
            changeXO[6] == changeXO[8] &&
            changeXO[6] != "") {
      if (changeXO[6] == "X") {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$FirstPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      } else {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$SecondPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      }
      _interstitialAd.show();
      _showWinDialog(changeXO[6]);
    } else if (
        // First column
        changeXO[0] == changeXO[3] &&
            changeXO[0] == changeXO[6] &&
            changeXO[0] != "") {
      if (changeXO[0] == "X") {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$FirstPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      } else {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$SecondPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      }
      _interstitialAd.show();
      _showWinDialog(changeXO[0]);
    } else if (
        // Second column
        changeXO[1] == changeXO[4] &&
            changeXO[1] == changeXO[7] &&
            changeXO[1] != "") {
      if (changeXO[1] == "X") {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$FirstPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      } else {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$SecondPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      }
      _interstitialAd.show();
      _showWinDialog(changeXO[1]);
    } else if (
        // Third column
        changeXO[2] == changeXO[5] &&
            changeXO[2] == changeXO[8] &&
            changeXO[2] != "") {
      if (changeXO[2] == "X") {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$FirstPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      } else {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$SecondPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      }
      _interstitialAd.show();
      _showWinDialog(changeXO[2]);
    } else if (
        // First Diagonal
        changeXO[0] == changeXO[4] &&
            changeXO[0] == changeXO[8] &&
            changeXO[0] != "") {
      if (changeXO[0] == "X") {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$FirstPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      } else {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$SecondPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      }
      _interstitialAd.show();
      _showWinDialog(changeXO[0]);
    } else if (
        // Second Diagonal
        changeXO[2] == changeXO[4] &&
            changeXO[2] == changeXO[6] &&
            changeXO[2] != "") {
      if (changeXO[2] == "X") {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$FirstPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      } else {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "$SecondPlayer wins",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      }
      _interstitialAd.show();
      _showWinDialog(changeXO[2]);
    } else if (filledbox == 9) {
      if (changeXO[0] == "X") {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "Game Draw",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      } else {
        int i = await DatabaseHelper.instance.insert({
          DatabaseHelper.columnName: "$FirstPlayer Vs $SecondPlayer",
          DatabaseHelper.gameStatus: "Game Draw",
          DatabaseHelper.statusColor: "PVP"
        });
        print(i);
      }
      _interstitialAd.show();
      _showDrawDialog();
    }
  }

  _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: (winner == "X")
                ? Text(
                    "Winner: $FirstPlayer",
                    style: TextStyle(fontSize: ScreenUtil().setSp(60)),
                  )
                : Text(
                    "Winner: $SecondPlayer",
                    style: TextStyle(fontSize: ScreenUtil().setSp(60)),
                  ),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Play Again",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(50),
                    ),
                  ))
            ],
          );
        });
    if (winner == "O") {
      setState(() {
        OScore = OScore + 1;
      });
    } else if (winner == "X") {
      setState(() {
        XScore = XScore + 1;
      });
    }
  }

  void _clearBoard() {
    for (var i = 0; i < 9; i++) {
      setState(() {
        changeXO[i] = "";
        filledbox = 0;
        Xturn = true;
      });
    }
  }

  _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "DRAW",
              style: TextStyle(fontSize: ScreenUtil().setSp(60)),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Play Again",
                    style: TextStyle(fontSize: ScreenUtil().setSp(50)),
                  ))
            ],
          );
        });
  }

  TextEditingController _firstPersonName = TextEditingController();
  TextEditingController _secondPlayerName = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  String FirstPlayer = '';
  // ignore: non_constant_identifier_names
  String SecondPlayer = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            "Enter name",
            style: TextStyle(fontSize: ScreenUtil().setSp(70)),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _firstPersonName,
                    validator: (value) {
                      return value.isNotEmpty ? null : "Invalid Field";
                    },
                    decoration: InputDecoration(
                      labelText: "First player name:",
                      labelStyle: TextStyle(fontSize: ScreenUtil().setSp(50)),
                    ),
                  ),
                  TextFormField(
                    controller: _secondPlayerName,
                    validator: (value) {
                      return value.isNotEmpty ? null : "Invalid Field";
                    },
                    decoration: InputDecoration(
                      labelText: "Second player name:",
                      labelStyle: TextStyle(fontSize: ScreenUtil().setSp(50)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "OK",
                style: TextStyle(fontSize: ScreenUtil().setSp(50)),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    FirstPlayer = _firstPersonName.text;
                    SecondPlayer = _secondPlayerName.text;
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          children: [
            Container(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
            Container(
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (FirstPlayer != "")
                          ? Text(
                              "$FirstPlayer",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(70),
                              ),
                            )
                          : Container(),
                      (FirstPlayer != "")
                          ? Text(
                              "$XScore",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(65),
                              ),
                            )
                          : Container()
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (SecondPlayer != "")
                          ? Text(
                              "$SecondPlayer",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(70),
                              ),
                            )
                          : Container(),
                      (SecondPlayer != "")
                          ? Text(
                              "$OScore",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(65),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        change(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[500],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            changeXO[index],
                            // "$index",
                            style: TextStyle(fontSize: ScreenUtil().setSp(110)),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _interstitialAd.show();

                    Navigator.pop(context);
                  },
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: ScreenUtil().setSp(30)),
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(60),
                      vertical: ScreenUtil().setHeight(30),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: ScreenUtil().setSp(8),
                        color: Colors.white,
                      ),
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().setSp(75)),
                    ),
                    child: Text(
                      "Back",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(75),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _interstitialAd.show();

                    _clearBoard();
                  },
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: ScreenUtil().setSp(30)),
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(60),
                      vertical: ScreenUtil().setHeight(30),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: ScreenUtil().setSp(8),
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setSp(75),
                      ),
                    ),
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(75),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
