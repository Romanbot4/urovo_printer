class PrintTextStyles {
  final List<PrintTextStyle> styles;
  const PrintTextStyles({required this.styles});
  int get value => styles.fold(0, (p, e) => p | e.id);
}

class PrintTextStyle {
  final int id;
  const PrintTextStyle(this.id);

  static const int _underline = 0x0001;
  static const int _italic = 0x0002;
  static const int _bold = 0x0004;
  static const int _reverseEffect = 0x0008;
  static const int _strikeOut = 0x0010;

  static const int value = _underline | _italic;

  static const PrintTextStyle underline = PrintTextStyle(_underline);
  static const PrintTextStyle italic = PrintTextStyle(_italic);
  static const PrintTextStyle bold = PrintTextStyle(_bold);
  static const PrintTextStyle reverseEffect = PrintTextStyle(_reverseEffect);
  static const PrintTextStyle strikeOut = PrintTextStyle(_strikeOut);

  static const List<PrintTextStyle> values = [
    underline,
    italic,
    bold,
    reverseEffect,
    strikeOut,
  ];

  String get name {
    switch (id) {
      case _underline:
        return "underline";
      case _italic:
        return "italic";
      case _bold:
        return "bold";
      case _reverseEffect:
        return "reverse effect";
      case _strikeOut:
        return "strike out";
      default:
        return "Unknown";
    }
  }
}
