import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:urovo_printer/constants/barcode_type.dart';
import 'package:urovo_printer/constants/rotation.dart';

import 'urovo_printer_method_channel.dart';

abstract class UrovoPrinterPlatform extends PlatformInterface {
  /// Constructs a UrovoPrinterPlatform.
  UrovoPrinterPlatform() : super(token: _token);

  static final Object _token = Object();

  static UrovoPrinterPlatform _instance = MethodChannelUrovoPrinter();

  /// The default instance of [UrovoPrinterPlatform] to use.
  ///
  /// Defaults to [MethodChannelUrovoPrinter].
  static UrovoPrinterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UrovoPrinterPlatform] when
  /// they register themselves.
  static set instance(UrovoPrinterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getDeviceId() {
    throw UnimplementedError('getDeviceId() has not been implemented.');
  }

  Future<String?> getTIDSN() {
    throw UnimplementedError('getTIDSN() has not been implemented.');
  }

  Future<int?> getStatus() {
    throw UnimplementedError('getStatus() has not been implemented.');
  }

  Future<int?> clearPage() {
    throw UnimplementedError('clearPage() has not been implemented.');
  }

  Future<int?> close() {
    throw UnimplementedError('close() has not been implemented.');
  }

  Future<int?> printPage(int page) {
    throw UnimplementedError('printPage() has not been implemented.');
  }

  Future<int?> forwardPaper(int len) {
    throw UnimplementedError('forwardPaper() has not been implemented.');
  }

  Future<int?> paperFeed(int len) {
    throw UnimplementedError('paperFeed() has not been implemented.');
  }

  Future<int?> getTemp() {
    throw UnimplementedError('getTemp() has not been implemented.');
  }

  Future<int?> open() {
    throw UnimplementedError('open() has not been implemented.');
  }

  Future<int?> printCachedPage() {
    throw UnimplementedError('printCachedPage() has not been implemented.');
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int?> setGreyLevel(int level) {
    throw UnimplementedError('setGreyLevel() has not been implemented.');
  }

  Future<int?> setupPage(int width, int height) {
    throw UnimplementedError('setupPage() has not been implemented.');
  }

  Future<int?> setSpeedLevel(int level) {
    throw UnimplementedError('setSpeedLevel() has not been implemented.');
  }

  Future<int?> drawBarcode(int x, int y, BarcodeType barcodeType, int width,
      int height, PrintRotation rotate) {
    throw UnimplementedError('drawBarcode() has not been implemented.');
  }

  Future<int?> drawText(String data, int x, int y, String fontName,
      int fontSize, bool bold, bool italic, int rotate) {
    throw UnimplementedError('drawText() has not been implemented.');
  }

  Future<int?> drawTextEx(String data, int x, int y, int width, int height,
      String fontName, int fontSize, int style, int rotate, int format) {
    throw UnimplementedError('drawTextEx() has not been implemented.');
  }

  Future<int?> drawLine(int x0, int y0, int x1, int y1, int lineWidth) {
    throw UnimplementedError('drawLine() has not been implemented.');
  }

  Future<int?> drawBitmap(List<int> imageBytes, int xDest, int yDest) {
    throw UnimplementedError('drawBitmap() has not been implemented.');
  }

  Future<int?> drawBitmapEx(List<int> imageBytes, int xDest, int yDest,
      int widthDest, int heightDest) {
    throw UnimplementedError('drawBitmap() has not been implemented.');
  }
}
