import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:urovo_printer/constants/barcode_type.dart';
import 'package:urovo_printer/constants/rotation.dart';

import 'urovo_printer_platform_interface.dart';

/// An implementation of [UrovoPrinterPlatform] that uses method channels.
class MethodChannelUrovoPrinter extends UrovoPrinterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('urovo_printer');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getDeviceId() async {
    final value = await methodChannel.invokeMethod('getDeviceId');
    return value;
  }

  @override
  Future<String?> getTIDSN() async {
    final value = await methodChannel.invokeMethod('getTIDSN');
    return value;
  }

  @override
  Future<int?> open() async {
    final value = await methodChannel.invokeMethod<int>('open');
    return value;
  }

  @override
  Future<int?> forwardPaper(int len) async {
    final value = await methodChannel.invokeMethod('forwardPaper', {
      'len': len,
    });
    return value;
  }

  @override
  Future<int?> paperFeed(int len) async {
    final value = await methodChannel.invokeMethod('paperFeed', {
      'len': len,
    });
    return value;
  }

  @override
  Future<int?> printPage(int page) async {
    final value = await methodChannel.invokeMethod('printPage', {
      'page': page,
    });
    return value;
  }

  @override
  Future<int?> clearPage() async {
    final value = await methodChannel.invokeMethod('clearPage');
    return value;
  }

  @override
  Future<int?> close() async {
    final value = await methodChannel.invokeMethod<int>('close');
    return value;
  }

  @override
  Future<int?> getStatus() async {
    final value = await methodChannel.invokeMethod<int>('getStatus');
    return value;
  }

  @override
  Future<int?> getTemp() async {
    final value = await methodChannel.invokeMethod<int>('getTemp');
    return value;
  }

  @override
  Future<int?> setGreyLevel(int level) async {
    final value = await methodChannel.invokeMethod<int>('setGreyLevel', {
      'level': level,
    });
    return value;
  }

  @override
  Future<int?> setSpeedLevel(int level) async {
    final value = await methodChannel.invokeMethod<int>('setSpeedLevel', {
      'level': level,
    });
    return value;
  }

  @override
  Future<int?> setupPage(int width, int height) async {
    final value = await methodChannel.invokeMethod<int>('setupPage', {
      'width': width,
      'height': height,
    });
    return value;
  }

  @override
  Future<int?> drawText(
    String data,
    int x,
    int y,
    String fontName,
    int fontSize,
    bool bold,
    bool italic,
    int rotate,
  ) async {
    final value = await methodChannel.invokeMethod('drawText', {
      'data': data,
      'x': x,
      'y': y,
      'fontname': fontName,
      'fontsize': fontSize,
      'bold': bold,
      'italic': italic,
      'rotate': rotate,
    });
    return value;
  }

  @override
  Future<int?> drawTextEx(
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
    final value = await methodChannel.invokeMethod('drawTextEx', {
      'data': data,
      'x': x,
      'y': y,
      'width': width,
      'height': height,
      'fontname': fontName,
      'fontsize': fontSize,
      'style': style,
      'rotate': rotate,
      'format': format,
    });
    return value;
  }

  @override
  Future<int?> drawLine(
    int x0,
    int y0,
    int x1,
    int y1,
    int lineWidth,
  ) async {
    final value = await methodChannel.invokeMethod('drawLine', {
      'x0': x0,
      'y0': y0,
      'x1': x1,
      'y1': y1,
      'lineWidth': lineWidth,
    });

    return value;
  }

  @override
  Future<int?> drawBarcode(
    int x,
    int y,
    BarcodeType barcodeType,
    int width,
    int height,
    PrintRotation rotate,
  ) async {
    final value = await methodChannel.invokeMethod('drawBarcode', {
      'x': x,
      'y': y,
      'barcodeType': barcodeType.id,
      'width': width,
      'height': height,
      'rotate': rotate.turn,
    });
    return value;
  }

  @override
  Future<int?> drawBitmap(List<int> imageBytes, int xDest, int yDest) async {
    final value = await methodChannel.invokeMethod('drawBitmap', {
      'bytes': imageBytes,
      'xDest': xDest,
      'yDest': yDest,
    });

    return value;
  }

  @override
  Future<int?> drawBitmapEx(List<int> imageBytes, int xDest, int yDest,
      int widthDest, int heightDest) async {
    final value = await methodChannel.invokeMethod('drawBitmap', {
      'bytes': imageBytes,
      'xDest': xDest,
      'yDest': yDest,
      'widthDest': widthDest,
      'heightDest': heightDest,
    });

    return value;
  }
}
