import 'dart:math';

void foo() {} // A top-level function

class A {
  static void bar() {} // A static method
  void baz() {} // An instance method
}

class Person {
  String firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  String name;
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee 1');
  }
}

class Point {
  final num x;
  final num y;
  final num distanceFromOrigin;

  Point(x, y)
      : x = x,
        y = y,
        distanceFromOrigin = sqrt(x * x + y * y) {
    print('point constructor');
  }

  Point.alongXAxis(num x) : this(x, 0);

  const Point.Immutable(this.x, this.y) : distanceFromOrigin = 0;

  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

void main() {
  var x;

  // Comparing top-level functions.
  x = foo;
  assert(foo == x);

  // Comparing static methods.
  x = A.bar;
  assert(A.bar == x);

  // Comparing instance methods.
  var v = A(); // Instance #1 of A
  var w = A(); // Instance #2 of A
  var y = w;
  x = w.baz;

  // These closures refer to the same instance (#2),
  // so they're equal.
  assert(y.baz == x);

  // These closures refer to different instances,
  // so they're unequal.
  assert(v.baz != w.baz);
  print(v.baz);
  print(w.baz);
  print(A.bar);

  // named constructor
  var emp = new Employee.fromJson({});

  var p = new Point(2, 3);
  print(p.distanceFromOrigin);
  var p2 = new Point.alongXAxis(3);
  print(p2.distanceFromOrigin);
  var p3 = new Point.Immutable(10, 20);
  print(p3.distanceFromOrigin);

  print('distance is:${p2.distanceTo(p)}');
}
