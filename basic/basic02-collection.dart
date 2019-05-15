// This is where the app starts executing.
main() {
  bool promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

  var list = [1, 2, 3];
  var list2 = [0, ...list];
  assert(list2.length == 4);
  print(list2);

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  print(listOfStrings);
}
