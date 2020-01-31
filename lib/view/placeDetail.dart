import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PlaceDetailView extends StatefulWidget {
  final dynamic data;
  PlaceDetailView({Key key, this.data}) : super(key: key);

  @override
  _PlaceDetailViewState createState() => _PlaceDetailViewState();
}

class _PlaceDetailViewState extends State<PlaceDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Place Detail'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(milliseconds: 500),
                  alignment: Alignment.center,
                  image: widget.data['image'],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        widget.data['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.data['description']),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
