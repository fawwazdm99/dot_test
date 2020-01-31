import 'package:dot_flutter_test/view/dashboard.dart';
import 'package:dot_flutter_test/view/error.dart';
import 'package:dot_flutter_test/view/galleryDetail.dart';
import 'package:dot_flutter_test/view/placeDetail.dart';
import 'package:dot_flutter_test/view/splashScreen.dart';

import 'package:flutter/material.dart';
import 'package:dot_flutter_test/router/routerPage.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case SplashScreenViewRoute:
      return MaterialPageRoute(builder: (context) => SplashScreenView());
    case DashboardViewRoute:
      return MaterialPageRoute(builder: (context) => DashboardView());
    case PLaceDetailViewRoute:
      return MaterialPageRoute(
          builder: (context) => PlaceDetailView(
                data: args,
              ));
    case GalleryDetailViewRoute:
      return MaterialPageRoute(
          builder: (context) => GalleryDetailView(
                data: args,
              ));
    default:
      return MaterialPageRoute(builder: (context) => ErrorView());
  }
}
