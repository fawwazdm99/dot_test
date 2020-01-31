import 'package:dot_flutter_test/router/routerPage.dart';
import 'package:flutter/material.dart';
import 'package:dot_flutter_test/bloc/logic/L_Gallery.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/painting.dart' as painting;

class ListGalleryView extends StatefulWidget {
  ListGalleryView({Key key}) : super(key: key);

  @override
  _ListGalleryViewState createState() => _ListGalleryViewState();
}

class _ListGalleryViewState extends State<ListGalleryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Gallery'),
        ),
        body: RefreshIndicator(
            onRefresh: () {
              painting.imageCache.clear();
              return bloc.fetchAllGallery();
            },
            child: Container(
              child: Container(
                child: StreamBuilder(
                  stream: bloc.getGallery,
                  initialData: bloc.getGalleryVal(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                            child: Text(
                              snapshot.error,
                              textAlign: TextAlign.center,
                            ),
                          ));
                    } else if (!snapshot.hasData) {
                      bloc.fetchAllGallery();
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      dynamic data = snapshot.data;
                      if (data['status_code'] != 200) {
                        return Text(
                            'Opps Something wrong, try reload the page');
                      } else {
                        return ListGalleryContainer(
                          data: data['data'],
                        );
                      }
                    }
                  },
                ),
              ),
            )));
  }
}

class ListGalleryContainer extends StatelessWidget {
  final dynamic data;
  const ListGalleryContainer({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(GalleryDetailViewRoute, arguments: {
              'caption': data[index]['caption'],
              'image': data[index]['image'],
            });
          },
          child: Container(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              fit: BoxFit.cover,
              fadeInDuration: Duration(milliseconds: 500),
              alignment: Alignment.center,
              image: data[index]['thumbnail'],
            ),
          ),
        );
      },
    );
  }
}
