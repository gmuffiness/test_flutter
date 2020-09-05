import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenB'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            color: Colors.red,
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text('ScreenA'),
          ),
          FlatButton(
            color: Colors.red,
            onPressed: () {
              Navigator.pushNamed(context, '/c');
            },
            child: Text('ScreenC'),
          ),
        ],
      )),
    );
  }
}
