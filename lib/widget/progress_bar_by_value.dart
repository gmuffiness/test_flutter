// https://www.youtube.com/watch?v=PMb_hlb-ERY

import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('progress bar'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomProgressBar2(
            width: 200,
            value: 50,
            totalValue: 100,
          ),
        ],
      ),
    );
  }
}

class CustomProgressBar2 extends StatelessWidget {
  final double width;
  final int value;
  final int totalValue;
  CustomProgressBar2({this.width, this.value, this.totalValue});

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
