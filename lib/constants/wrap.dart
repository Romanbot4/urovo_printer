class PrintTextWrap {
  final int status;
  const PrintTextWrap(this.status);

  static const int _noWrap = 0;
  static const int _withWrap = 1;

  static const noWrap = PrintTextWrap(_noWrap);
  static const withWrap = PrintTextWrap(_withWrap);

  static const List<PrintTextWrap> values = [
    noWrap,
    withWrap,
  ];

  String get name {
    switch (status) {
      case _noWrap:
        return "no wrap";
      case _withWrap:
        return "with wrap";
      default:
        return "Unknown";
    }
  }
}
