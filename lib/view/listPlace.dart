import 'dart:async';

import 'package:dot_flutter_test/router/routerPage.dart';
import 'package:flutter/material.dart';
import 'package:dot_flutter_test/bloc/logic/L_ListPlace.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/painting.dart' as painting;

class ListPlaceView extends StatefulWidget {
  ListPlaceView({Key key}) : super(key: key);

  @override
  _ListPlaceViewState createState() => _ListPlaceViewState();
}

class _ListPlaceViewState extends State<ListPlaceView> {
  Completer<void> _refreshCompleter;
  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Place'),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            painting.imageCache.clear();
            return bloc.fetchAllPlace();
          },
          child: Container(
            child: StreamBuilder(
              stream: bloc.getPlace,
              initialData: bloc.getPlaceVal(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: Text(
                          snapshot.error,
                          textAlign: TextAlign.center,
                        ),
                      ));
                } else if (!snapshot.hasData) {
                  bloc.fetchAllPlace();
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  dynamic data = snapshot.data;
                  if (data['status_code'] != 200) {
                    return Text('Opps Something wrong, try reload the page');
                  } else {
                    return ListPlaceContainer(
                      data: data['data'],
                    );
                  }
                }
              },
            ),
          ),
        ));
  }
}

class ListPlaceContainer extends StatelessWidget {
  final dynamic data;
  const ListPlaceContainer({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Stack(
          children: <Widget>[
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 500),
                alignment: Alignment.center,
                image: data[index]['image'],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(PLaceDetailViewRoute, arguments: {
                  'image': data[index]['image'],
                  'name': data[index]['name'],
                  'description': data[index]['description']
                });
              },
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data[index]['name'],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          shadows: [
                            Shadow(
                                color: Colors.black87,
                                blurRadius: 2,
                                offset: Offset(5, 0))
                          ]),
                    ),
                    Text(data[index]['location'],
                        style: TextStyle(color: Colors.white, shadows: [
                          Shadow(
                              color: Colors.black87,
                              blurRadius: 2,
                              offset: Offset(5, 0))
                        ]))
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
