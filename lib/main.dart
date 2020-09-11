import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/basic_screens/BuildContext_Practice_SnackBar_Toast.dart';
import 'package:test_flutter/basic_screens/Navigator_Practice.dart';
import 'package:test_flutter/basic_screens/ScreenA.dart';
import 'package:test_flutter/basic_screens/ScreenB.dart';
import 'package:test_flutter/basic_screens/ScreenC.dart';
import 'package:test_flutter/basic_screens/chef_login.dart';
import 'package:test_flutter/widget/progress_bar_by_timer.dart';
import 'package:test_flutter/movie_toy/main_page.dart';
import 'package:test_flutter/widget/progress_bar_by_value.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home과 initialRoute 둘 중 하나만 나와야 함.
      home: Test2(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => ScreenA(),
      //   '/b': (context) => ScreenB(),
      //   '/c': (context) => ScreenC(),
      // },
    );
  }
}
