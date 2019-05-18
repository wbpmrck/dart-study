class Foo {}

class Bar extends Foo {}

class GenerClass<T extends Foo> {
  String toString() => "Instance of 'GenerClass<$T>'";

  // it is a generic method
  T first<T>(List<T> ts) {
    T tmp = ts[0];
    return tmp;
  }
}

void main() {
  var names = List<String>();
  names.addAll(['Seth', 'Kathy', 'Lars']);
  print(names is List<
      String>); // Dart generic types are reified, which means that they carry their type information around at runtime.

  var bars = GenerClass<Bar>();
  // var bars2 = GenerClass<Object>(); // compile error , Object not extends Foo
  print(bars);
  print(bars is GenerClass<Foo>); // true ,becaulse Bar extends Foo
  print(bars is GenerClass<Bar>); // true

  print(bars.first(names)); // seth
}
