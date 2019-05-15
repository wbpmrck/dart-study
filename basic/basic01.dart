// Define a function.
printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
}

// This is where the app starts executing.
main() {
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  assert(list2.length == 4);
}
