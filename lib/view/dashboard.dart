import 'package:dot_flutter_test/view/about.dart';
import 'package:dot_flutter_test/view/listGallery.dart';
import 'package:dot_flutter_test/view/listPlace.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedView = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  static List<Widget> _widgetList = <Widget>[
    ListPlaceView(
      key: PageStorageKey('listPlace'),
    ),
    ListGalleryView(
      key: PageStorageKey('listGallery'),
    ),
    AboutView(
      key: PageStorageKey('about'),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedView = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: _widgetList[_selectedView],
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('List Place')),
          BottomNavigationBarItem(
              icon: Icon(Icons.image), title: Text('List Gallery')),
          BottomNavigationBarItem(icon: Icon(Icons.info), title: Text('About'))
        ],
        currentIndex: _selectedView,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}
