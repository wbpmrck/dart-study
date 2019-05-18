void main() {
  bool a = true;
  bool b = false;
  if (a) {
    print('a is true');
  } else if (b) {
    print('b is true');
  } else {
    print('nothing is true');
  }

  //for
  var collection = [0, 1, 2];
  for (var i = 0; i < collection.length; i++) {
    print(i); // 0 1 2
  }
  //for in
  var collection2 = [0, 1, 2];
  for (var x in collection2) {
    print(x); // 0 1 2
  }
}
