// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:urovo_printer/constants/status.dart';
import 'package:urovo_printer/urovo_printer.dart';

class PrintWidgetController {
  final double pixelRatio;
  final Size? pageSize;

  PrintWidgetController({
    this.pixelRatio = 8.0,
    this.pageSize,
  });

  GlobalKey containerKey = GlobalKey();

  static const Size defaultPageSize = Size(384, -1);

  // simple way to print out widget
  // will return height of printed image
  Future<int> printOut() async {
    try {
      await UrovoPrinter.open();

      final status = await UrovoPrinter.getStatus();
      if (status.id != PrinterStatus.ok) {
        if (kDebugMode) print("Printer Status Error : ${status.name}");
        return 0;
      }

      await UrovoPrinter.setupPage(pageSize ?? defaultPageSize);

      final imageBytes = await capture();
      if (imageBytes == null) {
        if (kDebugMode) print("Widget Generation Error : ${status.name}");
        return 0;
      }
      return await UrovoPrinter.drawBitmapEx(imageBytes, 0, 0, 348, 0) ?? 0;
    } catch (e) {
      if (kDebugMode) print(e);
      return 0;
    }
  }

  /// to capture widget to image by GlobalKey in RenderRepaintBoundary
  Future<Uint8List?> capture() async {
    try {
      /// boundary widget by GlobalKey
      RenderRepaintBoundary? boundary = containerKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary?;

      /// convert boundary to image
      final image = await boundary!.toImage(pixelRatio: pixelRatio);

      /// set ImageByteFormat
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final pngBytes = byteData?.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      rethrow;
    }
  }
}
