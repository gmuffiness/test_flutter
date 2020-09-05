import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Snack Bar'),
          centerTitle: true,
        ),
        // 방법1. builder 클래스를 이용해서 내부적으로 새로운 context 만들기
        body: Builder(
          builder: (BuildContext ctx) {
            return Center(
              child: Column(
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'show me',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red,
                    onPressed: () {
                      Scaffold.of(ctx).showSnackBar(
                        SnackBar(
                          content: Text('hello'),
                        ),
                      );
                    },
                  ),
                  FlatButton(
                    onPressed: () {
                      flutterToast();
                    },
                    child: Text('Toast'),
                    color: Colors.blue,
                  ),
                ],
              ),
            );
          },
        )
        // 방법2. 외부적으로 새로운 위젯을 파서 그 내부의 context 이용하기
        // body: MySnackBar(),
        );
  }
}

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        child: Text(
          'show me',
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.red,
        onPressed: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('hello'),
            ),
          );
        },
      ),
    );
  }
}

void flutterToast() {
  Fluttertoast.showToast(
    msg: 'Flutter',
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.redAccent,
    fontSize: 20.0,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
