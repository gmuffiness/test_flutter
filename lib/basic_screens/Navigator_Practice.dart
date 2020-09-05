import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) {
                return Page2();
                // 여기서 builder는 다른 context 참조하게 될 수도 있는 등 여러 오류를 미연에 방지하기 위한 일종의 안전장치
                // 다른 표기법. builder : (context) => Page2()

                // 앱 상에서 page 이동 시 기본적으로 제공되는 애니메이션
                // Andriod => 위로 올라오며 페이드 인 / 아래로 내려가며 페이드 아웃
                // IOS => 좌우로 화면이 움직이면서 페이지 이동이 되는 효과
              }),
            );
          },
          child: Text('Go to the Second Page'),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(ctx);
            // Scaffold 내 Appbar에서는 뒤로가기를 자동으로 지원해주기 때문에, 위 Appbar 있는 상황에서는 pop 필요없긴 함.
          },
          child: Text('Go to the First Page'),
        ),
      ),
    );
  }
}
