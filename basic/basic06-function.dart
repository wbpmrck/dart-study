import 'package:meta/meta.dart';

main(List<String> arguments) {
  print(arguments);

  bool isBiggerThanZero(int num) {
    return num > 0;
  }

  print(isBiggerThanZero(1));

  //arrow function
  bool isBiggerThanOne(int atomicNumber) => atomicNumber > 1;
  print(isBiggerThanOne(2));

  // optional param

  bool bt(int a, int b) {
    return a > b;
  }
  // print(bt(2)); //this will cause compile error.because function param is required

  bool printChar({@required int a, int b}) {
    print(a);
    print(b);
  }

  printChar(a: 2); // omit the second named param
  printChar(b: 2); // omit the first named param will cause error

  String say(String from, [String msg = 'hello', String device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    return result;
  }

  assert(say('Bob', 'Howdy') ==
      'Bob says Howdy'); // positiond params can be omit either

  assert(say('Bob') ==
      'Bob says hello'); // positiond params can have default value

  // function can be passed as parameter
  void printElement(int element) {
    print(element);
  }

  var list = [1, 2, 3];

  // Pass printElement as a parameter.
  list.forEach(printElement);

  // anonymous function
  var list2 = ['apples', 'bananas', 'oranges'];
  list2.forEach((item) {
    print('${list2.indexOf(item)}: $item');
  });
  // arrow function
  list2.forEach((item) => print('${list2.indexOf(item)}: $item'));
}
