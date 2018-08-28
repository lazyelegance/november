import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';

class NovemberApp extends StatefulWidget {
  @override
  NovemberAppState createState() {
    return new NovemberAppState();
  }
}

class NovemberAppState extends State<NovemberApp>
    with TickerProviderStateMixin {
  startTimeout([int milliseconds]) {
    const timeout = const Duration(seconds: 3);
    const ms = const Duration(milliseconds: 1);
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    // callback function
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  _pluralString(int item, String unit) {
    return item == 1 ? ' ${(unit)}' : ' ${(unit)}s';
  }

  @override
  Widget build(BuildContext context) {
    startTimeout(1000);
    var now = new DateTime.now();
    var moonLanding = DateTime.parse("2018-11-01 12:00:00Z");

    var difference = moonLanding.difference(now);

    var days =
        '${(difference.inDays).toString()}${_pluralString(difference.inDays, 'day')}';

    var hours =
        '${(difference.inHours - 24*difference.inDays).toString()}${_pluralString(difference.inHours - 24*difference.inDays, 'hour')}';

    var mins =
        '${(difference.inMinutes - 60*difference.inHours).toString().padLeft(2, '0')}${_pluralString(difference.inMinutes - 60*difference.inHours, 'min')}';

    var secs =
        '${(difference.inSeconds - difference.inMinutes* 60).toString().padLeft(2, '0')}${_pluralString(difference.inSeconds - difference.inMinutes* 60, 'second')}';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              child: Image.asset(
                'images/bcg.JPG',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.black.withOpacity(0.3)),
              ),
            ),
            SafeArea(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    days,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontFamily: 'Raleway'),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    hours,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontFamily: 'Raleway'),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    mins,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontFamily: 'Raleway'),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    secs,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontFamily: 'Raleway'),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
