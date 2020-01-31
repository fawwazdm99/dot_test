import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class GalleryDetailView extends StatefulWidget {
  final dynamic data;
  GalleryDetailView({Key key, this.data}) : super(key: key);

  @override
  _GalleryDetailViewState createState() => _GalleryDetailViewState();
}

class _GalleryDetailViewState extends State<GalleryDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gallery Detail'),
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
                      child: Text(widget.data['caption']),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
