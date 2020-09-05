import 'package:flutter/material.dart';
import 'package:test_flutter/basic_screens/BuildContext_Practice_SnackBar_Toast.dart';
import 'package:test_flutter/basic_screens/Navigator_Practice.dart';
import 'package:test_flutter/basic_screens/ScreenA.dart';
import 'package:test_flutter/basic_screens/ScreenB.dart';
import 'package:test_flutter/basic_screens/ScreenC.dart';
import 'package:test_flutter/basic_screens/chef_login.dart';
import 'package:test_flutter/movie_toy/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home과 initialRoute 둘 중 하나만 나와야 함.
      home: MainPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => ScreenA(),
      //   '/b': (context) => ScreenB(),
      //   '/c': (context) => ScreenC(),
      // },
    );
  }
}
