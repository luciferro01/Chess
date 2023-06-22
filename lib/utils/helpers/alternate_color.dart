bool alternateColor(int index) {
  var x = index ~/ 8;
  var y = index % 8;
  bool isWhite = (x + y) % 2 == 0;
  return isWhite;
}
