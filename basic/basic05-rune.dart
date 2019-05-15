// This is where the app starts executing.
main() {
  var clapping = '\u{1f44f}';
  print(clapping);
  print(clapping.codeUnits); // 这里的值，涉及到字符的基本平面以外的知识
  print(clapping.runes.toList());

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));
}
