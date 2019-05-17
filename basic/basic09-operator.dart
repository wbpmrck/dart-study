class Person {
  String ssn;
  String name;

  Person(this.ssn, this.name);

  // Define that two persons are equal if their SSNs are equal
  bool operator ==(other) {
    return (other is Person && other.ssn == ssn);
  }
}

void main() {
  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5); // Result is a double
  assert(5 ~/ 2 == 2); // Result is an int
  assert(5 % 2 == 1); // Remainder

  assert(2 == 2);
  assert(2 != 3);
  assert(3 > 2);
  assert(2 < 3);
  assert(3 >= 3);
  assert(2 <= 3);

  var bob = new Person('111', 'Bob');
  var robert = new Person('111', 'Robert');

  /*
    1.If x or y is null, return true if both are null, and false if only one is null.

    2.Return the result of the method invocation x.==(y). (That’s right, operators such as == are methods that are invoked on their first operand. You can even override many operators, including ==, as you’ll see in Overridable operators.)
  */
  print(bob == robert); // true

  // identical method is === in js
  print(identical(
      bob, robert)); // false, because these are two different instances

  final value = 0x22;
  final bitmask = 0x0f;

  assert((value & bitmask) == 0x02); // AND
  assert((value & ~bitmask) == 0x20); // AND NOT
  assert((value | bitmask) == 0x2f); // OR
  assert((value ^ bitmask) == 0x2d); // XOR
  assert((value << 4) == 0x220); // Shift left
  assert((value >> 4) == 0x02); // Shift right
}
