class PrintRotation {
  final int turn;
  const PrintRotation(this.turn);

  static const int _zeroDegree = 0;
  static const int _ninetyDegree = 1;
  static const int _oneEightyDegree = 2;
  static const int _twoSeventyDegree = 3;

  static const zeroDegree = PrintRotation(_zeroDegree);
  static const ninetyDegree = PrintRotation(_ninetyDegree);
  static const oneEightyDegree = PrintRotation(_oneEightyDegree);
  static const twoSeventyDegree = PrintRotation(_twoSeventyDegree);

  static const List<PrintRotation> values = [
    zeroDegree,
    ninetyDegree,
    oneEightyDegree,
    twoSeventyDegree,
  ];

  String get name {
    switch (turn) {
      case _zeroDegree:
        return "no rotation";
      case _ninetyDegree:
        return "rotate 90 degree";
      case _oneEightyDegree:
        return "rotate 180 degree";
      case _twoSeventyDegree:
        return "rotate 270 degree";
      default:
        return "Unknown";
    }
  }
}
