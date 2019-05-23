Future<String> lookUpVersion() async => '1.0.0';

void main() async {
  var v = await lookUpVersion();

  print(v);
}
