import 'dart:math';

Set<int> lottoNumber() {
  final random = Random();
  final Set<int> lottoSet = {};
  // var num;

  while (lottoSet.length != 6) {
    //num = random.nextInt(45) + 1;
    lottoSet.add(random.nextInt(45) + 1);
  }

  // for (int i = 0; i < 6; i++) {
  //   num = random.nextInt(45) + 1;
  //   lottoSet.add(num);
  // }

  print('당첨번호');
  print(lottoSet.toList());

  return lottoSet;
}

Set<int> myNumber() {
  final random = Random();
  final Set<int> mySet = {};
  // var num;

  while (mySet.length != 6) {
    //num = random.nextInt(45) + 1;
    mySet.add(random.nextInt(45) + 1);
  }

  // for (int i = 0; i < 6; i++) {
  //   num = random.nextInt(45) + 1;
  //   lottoSet.add(num);
  // }

  print('내번호');
  print(mySet.toList());

  return mySet;
}

int checkNumber(lottoSet, mySet) {
  int match = 0;

  for (int lotto in lottoSet) {
    for (int myNum in mySet) {
      // print('로또번호 : $lotto');
      // print('내번호 : $myNum');
      if (lotto == myNum) {
        match++;
      }
    }
  }
  return match;
}

void main() {
  Set<int> lottoFinal = lottoNumber();
  Set<int> myFinal = myNumber();

  checkNumber(lottoFinal, myFinal);
}
