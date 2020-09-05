List<int> lottoNumber() {
  var lottoNumber =
      (List<int>.generate(45, (index) => index + 1)..shuffle()).sublist(0, 6);

  print('당첨번호');
  print(lottoNumber);

  return lottoNumber;
}

List<int> myNumber() {
  var myNumber =
      (List<int>.generate(45, (index) => index + 1)..shuffle()).sublist(0, 6);

  print('당첨번호');
  print(myNumber);

  return myNumber;
}

int checkNumber(List<int> lottoNumber, List<int> myNumber) {
  int match = 0;

  for (int lotto in lottoNumber) {
    for (int myNum in myNumber) {
      // print('로또번호 : $lotto');
      // print('내번호 : $myNum');
      if (lotto == myNum) {
        match++;
        print('당첨번호:$lotto');
      }
    }
  }
  print('$match 개의 당첨번호가 있습니다.');
  return match;
}

void man() {
  List<int> lottoFinal = lottoNumber();
  List<int> myFinal = myNumber();

  checkNumber(lottoFinal, myFinal);
}
