import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  Dice({this.email});

  final String email;
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  String email;
  int leftImg = 1;
  int rightImg = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Dice game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(email),
            FlatButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text('logout')),
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset('images/Img$leftImg.PNG'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Image.asset('images/Img$rightImg.PNG'),
                  ),
                  // Image(
                  //   image: AssetImage('images/orange.PNG'),
                  //   width: 300.0,
                  //   height: 300.0,
                  // )
                ],
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            ButtonTheme(
              minWidth: 100.0,
              height: 60.0,
              child: RaisedButton(
                color: Colors.orangeAccent,
                onPressed: () {
                  setState(() {
                    leftImg = Random().nextInt(3) + 1;
                    rightImg = Random().nextInt(3) + 1;
                  });
                  showToast('Left Img : {$leftImg}, Right Img : {$rightImg}');
                },
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}
