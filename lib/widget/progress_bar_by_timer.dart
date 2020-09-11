// https://www.youtube.com/watch?v=PMb_hlb-ERY

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('progress bar'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<TimeState>(
        create: (context) => TimeState(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<TimeState>(
              builder: (context, timeState, _) => CustomProgressBar(
                width: 200,
                value: timeState.time,
                totalValue: 15,
              ),
            ),
            SizedBox(height: 10),
            Consumer<TimeState>(
              builder: (context, timeState, _) => RaisedButton(
                onPressed: () {
                  Timer.periodic(Duration(seconds: 1), (timer) {
                    if (timeState.time == 0)
                      timer.cancel();
                    else
                      timeState.time -= 1;
                  });
                },
                child: Text('starts'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  final double width;
  final int value;
  final int totalValue;
  CustomProgressBar({this.width, this.value, this.totalValue});

  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.timer,
          color: Colors.grey[700],
        ),
        SizedBox(
          width: 5,
        ),
        Stack(
          children: [
            Container(
              width: width,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(5),
              child: AnimatedContainer(
                height: 10,
                width: width * ratio,
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: (ratio < 0.3)
                      ? Colors.red
                      : (ratio < 0.6) ? Colors.amber[400] : Colors.lightGreen,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class TimeState with ChangeNotifier {
  int _time = 15;

  int get time => _time;
  set time(int newTime) {
    _time = newTime;
    notifyListeners();
  }
}
