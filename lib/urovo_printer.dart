import 'package:flutter/cupertino.dart';
import 'package:urovo_printer/constants/rotation.dart';
import 'package:urovo_printer/constants/speed_value.dart';
import 'package:urovo_printer/constants/text_style.dart';
import 'package:urovo_printer/constants/wrap.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import 'constants/grey_value.dart';
import 'constants/status.dart';
import 'urovo_printer_platform_interface.dart';

export 'package:urovo_printer/widgets/print_widget.dart';
export 'package:urovo_printer/widgets/print_controller.dart';
export 'package:widgets_to_image/widgets_to_image.dart';

class UrovoPrinter {
  static Future<String?> getPlatformVersion() {
    return UrovoPrinterPlatform.instance.getPlatformVersion();
  }

  static Future<String?> getDeviceId() async {
    return UrovoPrinterPlatform.instance.getDeviceId();
  }

  static Future<String?> getTIDSN() async {
    return UrovoPrinterPlatform.instance.getTIDSN();
  }

  static Future<int?> open() async {
    return UrovoPrinterPlatform.instance.open();
  }

  static Future<int?> forwardPaper(int len) async {
    return UrovoPrinterPlatform.instance.forwardPaper(len);
  }

  static Future<int?> paperFeed(int len) async {
    return UrovoPrinterPlatform.instance.paperFeed(len);
  }

  static Future<int?> printPage(int page) async {
    return UrovoPrinterPlatform.instance.printPage(page);
  }

  static Future<int?> clearPage() async {
    return UrovoPrinterPlatform.instance.clearPage();
  }

  static Future<int?> close() async {
    return UrovoPrinterPlatform.instance.close();
  }

  static Future<PrinterStatus> getStatus() async {
    final value = await UrovoPrinterPlatform.instance.getStatus();
    return PrinterStatus(value ?? 9999);
  }

  static Future<int?> getTemp() async {
    return UrovoPrinterPlatform.instance.getTemp();
  }

  /// Set Grey Value: Limit= 0 to 4
  static Future<int?> setGreyLevel(int level) async {
    assert(level >= GreyValue.min && level <= GreyValue.max);
    return UrovoPrinterPlatform.instance.setGreyLevel(level);
  }

  /// Set Grey Value: Limit= 0 to 9
  static Future<int?> setSpeedLevel(int level) async {
    assert(level >= SpeedValue.min && level <= SpeedValue.max);
    return UrovoPrinterPlatform.instance.setSpeedLevel(level);
  }

  static Future<int?> setupPage(Size size) async {
    return UrovoPrinterPlatform.instance.setupPage(
      size.width.toInt(),
      size.height.toInt(),
    );
  }

  static Future<int?> drawStyledText(
    String data,
    int x,
    int y,
    int width,
    int height,
    String fontName,
    int fontSize, {
    PrintTextStyles styles = const PrintTextStyles(styles: []),
    PrintRotation rotation = PrintRotation.zeroDegree,
    PrintTextWrap wrap = PrintTextWrap.noWrap,
  }) async {
    return UrovoPrinterPlatform.instance.drawTextEx(
      data,
      x,
      y,
      width,
      height,
      fontName,
      fontSize,
      styles.value,
      rotation.turn,
      wrap.status,
    );
  }

  static Future<int?> drawText(
    String data,
    int x,
    int y,
    String fontName,
    int fontSize,
    bool bold,
    bool italic,
    int rotate,
  ) async {
    return UrovoPrinterPlatform.instance.drawText(
      data,
      x,
      y,
      fontName,
      fontSize,
      bold,
      italic,
      rotate,
    );
  }

  static Future<int?> drawTextEx(
    String data,
    int x,
    int y,
    int width,
    int height,
    String fontName,
    int fontSize,
    int style,
    int rotate,
    int format,
  ) async {
    return UrovoPrinterPlatform.instance.drawTextEx(
      data,
      x,
      y,
      width,
      height,
      fontName,
      fontSize,
      style,
      rotate,
      format,
    );
  }

  static Future<int?> drawLine({
    required int x0,
    required int y0,
    required int x1,
    required int y1,
    int lineWidth = 1,
  }) async {
    return UrovoPrinterPlatform.instance.drawLine(
      x0,
      y0,
      x1,
      y1,
      lineWidth,
    );
  }

  static Future<int?> drawBitmap(
      List<int> imageBytes, int xDest, int yDest) async {
    return UrovoPrinterPlatform.instance.drawBitmap(
      imageBytes,
      xDest,
      yDest,
    );
  }

  static Future<int?> drawBitmapEx(List<int> imageBytes, int xDest, int yDest,
      int widthDest, int heightDest) async {
    final value = await UrovoPrinterPlatform.instance.drawBitmapEx(
      imageBytes,
      xDest,
      yDest,
      widthDest,
      heightDest,
    );

    return value;
  }

  static Future<int?> drawWidget(
    WidgetsToImageController controller, {
    int xDest = 0,
    int yDest = 0,
  }) async {
    final imageBytes = await controller.capture();
    if (imageBytes == null) return null;
    return drawBitmap(imageBytes, xDest, yDest);
  }
}
