import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AboutView extends StatefulWidget {
  AboutView({Key key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
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
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            title: Text('About'),
            bottom: PreferredSize(
              preferredSize: Size(200, 50),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.75,
                child: TabBar(
                  indicatorColor: Colors.white,
                  tabs: <Widget>[
                    Tab(
                      child: Text('Informasi'),
                    ),
                    Tab(
                      child: Text('Versi Rilis'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: FutureBuilder(
                  future: getAppName(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text('');
                    } else {
                      return Text(snapshot.data);
                    }
                  },
                ),
              ),
              Center(
                child: FutureBuilder(
                  future: getAppVersion(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text('');
                    } else {
                      return Text('Versi ' + snapshot.data);
                    }
                  },
                ),
              )
            ],
          )),
    );
  }
}
