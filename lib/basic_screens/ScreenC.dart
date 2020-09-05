import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenC'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            color: Colors.red,
            onPressed: () {
              Navigator.pushNamed(context, '/b');
            },
            child: Text('ScreenB'),
          ),
          FlatButton(
            color: Colors.red,
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text('ScreenA'),
          ),
        ],
      )),
    );
  }
}
