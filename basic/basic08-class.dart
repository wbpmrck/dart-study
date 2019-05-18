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

class Boss implements Person {
  String bossName;
  String get firstName => bossName; //实现接口1
  void set firstName(name) => bossName = name; //实现接口1

  Boss(this.bossName);
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

class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

abstract class Animal {
  // Define instance variables and methods...

  void shout(); // Define an abstract method.
}

class Dog extends Animal {
  void shout() {
    // Provide an implementation, so the method is not abstract here...
    print('wof wof!');
  }

  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' +
        '${invocation.memberName}');
  }
}

class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  // Operator == and hashCode not shown. For details, see note below.
  // ···
}

// class is also work,but mixable class has many limits:no constructor and so no....
// class Robot {
mixin Robot {
  String robotName = '';
  void run() {
    print('robot:${robotName} is running');
  }
}

class RobotDog extends Dog with Robot {
  RobotDog();
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

  //Getters and setters

  var rect = Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);

  // implement interface
  var boss = Boss('clark');
  print(boss.firstName);

  // extend class
  var bingo = Dog();
  bingo.shout();

  // no such method
  // bingo.run();   //这里不能运行，得使用dynamic才能避免编译器报错

  // override operator
  final v1 = Vector(2, 3);
  final w1 = Vector(2, 2);

  assert((v1 + w1).x == 4);
  assert((v1 + w1).y == 5);

  RobotDog sammy = RobotDog();
  sammy.shout();
  sammy.run();
}
