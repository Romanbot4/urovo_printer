import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:urovo_printer/constants/rotation.dart';
import 'package:urovo_printer/constants/status.dart';
import 'package:urovo_printer/constants/text_style.dart';
import 'package:urovo_printer/constants/wrap.dart';
import 'package:urovo_printer/urovo_printer.dart';

class PrinterService {
  const PrinterService._internal();

  static const PrinterService _instance = PrinterService._internal();

  static bool _isInitialized = false;
  static Future<PrinterService> getInstance() async {
    if (!_isInitialized) await _initialize();
    _isInitialized = true;
    return _instance;
  }

  static String? platformVersion;
  static String? deviceId;
  static String? temp;
  static String? deviceTidsn;
  static PrinterStatus? status;
  static const Size pageSize = Size(384, -1);

  static Future<void> _initialize() async {
    await unloadFontToStorage();

    try {
      platformVersion = await UrovoPrinter.getPlatformVersion();
    } catch (e) {
      print("Failed to get Platform Version");
    }

    try {
      await UrovoPrinter.open();
    } catch (e) {
      print("Failed to Open");
    }

    try {
      await UrovoPrinter.setupPage(pageSize);
    } catch (e) {
      print("Failed to Setup Page");
    }

    try {
      platformVersion = await UrovoPrinter.getPlatformVersion() ?? 'Unknown';
    } on PlatformException {
      //
    }

    try {
      status = await UrovoPrinter.getStatus();
    } on PlatformException {
      //
    }

    try {
      temp = (await UrovoPrinter.getTemp()).toString();
    } on PlatformException {
      //
    }

    try {
      deviceId = (await UrovoPrinter.getDeviceId()).toString();
    } on PlatformException {
      //
    }

    try {
      deviceTidsn = await UrovoPrinter.getTIDSN() ?? '';
    } on PlatformException {
      //
    }
  }

  static late String _fontPath;
  static Future<void> unloadFontToStorage() async {
    final extDir = await getExternalStorageDirectory();
    if (extDir == null || !extDir.path.startsWith('/storage/emulated/0/')) {
      return;
    }

    _fontPath = '/storage/emulated/0/zawgyi-one.ttf';

    final file = File(_fontPath);
    if (await file.exists()) return;

    final bytes = await rootBundle.load('assets/zawgyi-one.ttf');
    await file.create(recursive: true);
    await file.writeAsBytes(bytes.buffer.asUint8List());
  }

  Future<void> checkOut() async {
    await UrovoPrinter.printPage(0);
    await UrovoPrinter.paperFeed(180);
  }

  Future<void> clearQueue() async {
    await UrovoPrinter.clearPage();
  }

  Future<int> drawParagraph({
    required String data,
    int fontSize = 22,
    String? fontPath,
    bool useZawgyiConversion = true,
  }) async {
    final splitted = data.split('\n');

    int height = 0;
    for (String text in splitted) {
      height += await drawStyledText(
        data: text,
        dy: height,
        fontPath: fontPath,
        fontSize: fontSize,
      );
    }
    return height;
  }

  Future<int> drawStyledText({
    required String data,
    int fontSize = 22,
    int dx = 0,
    int dy = 0,
    String? fontPath,
    int width = 381,
    int height = -1,
    PrintTextStyles styles = const PrintTextStyles(styles: []),
    PrintRotation rotation = PrintRotation.zeroDegree,
    PrintTextWrap wrap = PrintTextWrap.noWrap,
  }) async {
    final value = await UrovoPrinter.drawStyledText(
      data,
      dx,
      dy,
      width,
      height,
      fontPath ?? _fontPath,
      fontSize,
      styles: styles,
      rotation: rotation,
      wrap: wrap,
    );
    return value ?? 0;
  }

  Future<int?> drawLine({
    int x0 = 0,
    int y0 = 0,
    int x1 = 341,
    int y1 = 0,
    int lineWidth = 8,
  }) async {
    final value = await UrovoPrinter.drawLine(
      x0: x0,
      y0: y0,
      x1: x1,
      y1: y1,
      lineWidth: lineWidth,
    );
    return value;
  }

  Future<int?> drawBitMap(List<int> bytes) async {
    return await UrovoPrinter.drawBitmapEx(bytes, 0, 0, 348, 0);
  }
}
