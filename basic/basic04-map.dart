// This is where the app starts executing.
main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  assert(gifts['sss'] == null);
  assert(gifts.length == 3);
  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };
  var gifts2 = Map();
  gifts2['first2'] = 'partridge';
  gifts2['second2'] = 'turtledoves';
  gifts2['fifth2'] = 'golden rings';

  var all = {...gifts, ...nobleGases};
  assert(all.length == 6);
  print(gifts);
  print(gifts2);
  print(nobleGases);
  print(all);
}
