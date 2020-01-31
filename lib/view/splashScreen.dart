import 'dart:async';

import 'package:dot_flutter_test/router/routerPage.dart';
import 'package:flutter/material.dart';
import 'package:dot_flutter_test/bloc/logic/L_SplashScreen.dart';
import 'package:package_info/package_info.dart';

class SplashScreenView extends StatefulWidget {
  SplashScreenView({Key key}) : super(key: key);

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigatePage);
  }

  void navigatePage() {
    Navigator.of(context).pushReplacementNamed(DashboardViewRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(child: SplashView()),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({
    Key key,
  }) : super(key: key);

  Future getAppName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    return appName;
  }

  Future getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String version = packageInfo.version;
    return version;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: FutureBuilder(
                  future: getAppName(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text('');
                    } else {
                      return Text(
                        snapshot.data,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'DancingScript',
                            fontSize: 24),
                      );
                    }
                  },
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                child: FutureBuilder(
                  future: getAppVersion(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text('');
                    } else {
                      return Text(
                        'Versi ' + snapshot.data,
                        style: TextStyle(color: Colors.white),
                      );
                    }
                  },
                ),
              ))
        ],
      ),
    );
  }
}
