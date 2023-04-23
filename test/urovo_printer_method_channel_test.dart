import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:urovo_printer/urovo_printer_method_channel.dart';

void main() {
  MethodChannelUrovoPrinter platform = MethodChannelUrovoPrinter();
  const MethodChannel channel = MethodChannel('urovo_printer');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
