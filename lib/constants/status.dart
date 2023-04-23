class PrinterStatus {
  final int id;
  const PrinterStatus(this.id);

  static const int ok = 0;
  static const int outOfPaper = -1;
  static const int overHeat = -2;
  static const int underVoltage = -3;
  static const int busy = -4;
  static const int error = -256;
  static const int driverError = -257;

  String get name {
    switch (id) {
      case ok:
        return "OK";
      case outOfPaper:
        return "Out of paper";
      case overHeat:
        return "Over heat";
      case underVoltage:
        return "Under voltage";
      case busy:
        return "Busy";
      case error:
        return "Error";
      case driverError:
        return "Driver Error";
      default:
        return "Unknown";
    }
  }
}
