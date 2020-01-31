import 'package:dot_flutter_test/router/routerPage.dart';
import 'package:flutter/material.dart';
import 'package:dot_flutter_test/router/router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DOT FLutter Test',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              color: Colors.teal,
              textTheme: TextTheme(
                  title: TextStyle(
                      fontFamily: 'DancingScript',
                      fontWeight: FontWeight.bold,
                      fontSize: 18)))),
      onGenerateRoute: router.generateRoute,
      initialRoute: SplashScreenViewRoute,
    );
  }
}
