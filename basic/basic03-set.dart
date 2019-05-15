// This is where the app starts executing.
main() {
  //set literal
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

  // a set
  Set<String> names = {};

  // manipulate
  names.add('foo');
  names.addAll(halogens);

  // spread operator
  var names2 = {'a', ...names, 'b'};

  assert(names.length == 6);
  assert(names2.length == 8);
  print(names);
  print(names2);
}
