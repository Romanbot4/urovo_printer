// import 'package:flutter_test/flutter_test.dart';
// import 'package:urovo_printer/urovo_printer.dart';
// import 'package:urovo_printer/urovo_printer_platform_interface.dart';
// import 'package:urovo_printer/urovo_printer_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockUrovoPrinterPlatform
//     with MockPlatformInterfaceMixin
//     implements UrovoPrinterPlatform {
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');

//   @override
//   Future<int?> clearPage() {
//     // TODO: implement clearPage
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> close() {
//     // TODO: implement close
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> drawBarcode(
//     int x,
//     int y,
//     int barcodeType,
//     int width,
//     int height,
//     int rotate,
//   ) {
//     // TODO: implement drawBarcode
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> drawBitmap(
//     String bmp,
//     int xDest,
//     int yDest,
//   ) {
//     // TODO: implement drawBitmap
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> drawBitmapEx(
//     List<int> pbmp,
//     int xDest,
//     int yDest,
//     int widthDest,
//     int heightDest,
//   ) {
//     // TODO: implement drawBitmapEx
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> drawLine(
//     int x0,
//     int y0,
//     int x1,
//     int y1,
//     int lineWidth,
//   ) {
//     // TODO: implement drawLine
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> drawText(
//     String data,
//     int x,
//     int y,
//     String fontName,
//     int fontSize,
//     bool bold,
//     bool italic,
//     int rotate,
//   ) {
//     // TODO: implement drawText
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> getStatus() {
//     // TODO: implement getStatus
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> getTemp() {
//     // TODO: implement getTemp
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> open() {
//     // TODO: implement open
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> printCachedPage() {
//     // TODO: implement printCachedPage
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> setGreyLevel(int level) {
//     // TODO: implement setGreyLevel
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> setSpeedLevel(int level) {
//     // TODO: implement setSpeedLevel
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> setupPage(int width, int height) {
//     // TODO: implement setupPage
//     throw UnimplementedError();
//   }

//   @override
//   Future<String?> getDeviceId() {
//     // TODO: implement getDeviceId
//     throw UnimplementedError();
//   }

//   @override
//   Future<String?> getTIDSN() {
//     // TODO: implement getTIDSN
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> forwardPaper(int len) {
//     // TODO: implement forwardPaper
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> printPage(int page) {
//     // TODO: implement printPage
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> paperFeed(int len) {
//     // TODO: implement paperFeed
//     throw UnimplementedError();
//   }

//   @override
//   Future<int?> drawTextEx(String data, int x, int y, int width, int height,
//       String fontName, int fontSize, int style, int rotate, int format) {
//     // TODO: implement drawTextEx
//     throw UnimplementedError();
//   }
// }

// void main() {
//   final UrovoPrinterPlatform initialPlatform = UrovoPrinterPlatform.instance;

//   test('$MethodChannelUrovoPrinter is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelUrovoPrinter>());
//   });

//   test('getPlatformVersion', () async {
//     UrovoPrinter urovoPrinterPlugin = UrovoPrinter();
//     MockUrovoPrinterPlatform fakePlatform = MockUrovoPrinterPlatform();
//     UrovoPrinterPlatform.instance = fakePlatform;

//     expect(await urovoPrinterPlugin.getPlatformVersion(), '42');
//   });
// }
