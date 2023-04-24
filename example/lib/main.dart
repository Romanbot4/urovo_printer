// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:urovo_printer/constants/grey_value.dart';
import 'package:urovo_printer/constants/speed_value.dart';
import 'package:urovo_printer/constants/status.dart';
import 'package:urovo_printer/urovo_printer.dart';
import 'package:urovo_printer_example/service/printer_service.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _textController = TextEditingController(text: sampleVocherText);

  late PrintWidgetController _printWidgetController;
  late double _width;

  String _platformVersion = 'Unknown';
  PrinterStatus? _status;
  String _temp = '0';
  String _deviceId = '';
  String _deviceTidsn = '';

  int _currentGreyValue = 0;
  int _currentSpeedValue = 0;

  static const double _printFontSize = 17.0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  static const Size pageSize = Size(384, -1);

  Future<void> loadData() async {
    try {
      final value = await UrovoPrinter.getPlatformVersion();
      if (value != null) _platformVersion = value;
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
      await UrovoPrinter.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      //
    }

    try {
      _status = await UrovoPrinter.getStatus();
    } on PlatformException {
      //
    }

    try {
      _temp = (await UrovoPrinter.getTemp()).toString();
    } on PlatformException {
      //
    }

    try {
      _deviceId = (await UrovoPrinter.getDeviceId()).toString();
    } on PlatformException {
      //
    }

    try {
      _deviceTidsn = await UrovoPrinter.getTIDSN() ?? '';
    } on PlatformException {
      //
    }

    if (mounted) setState(() {});
  }

  Future<void> _printText() async {
    final printer = await PrinterService.getInstance();
    await printer.clearQueue();

    await printer.drawParagraph(data: _textController.text);
    await printer.checkOut();
  }

  Future<void> _printWidget() async {
    final printer = await PrinterService.getInstance();
    await printer.clearQueue();
    await _printWidgetController.printOut();
    await printer.checkOut();
  }

  static const String sampleVocherText = """
City Express (1001045)
နေရပ်လိပ်စာ - No.353, R-4 မဟာဘနနှင့်ကျောင်း
သားလမ်း,(၇) QR, ကျောက်တံတားမြို့။
နေ့စဉ် ၂၄ နာရီအတွင်းရောက်ပါ။
01/NTH 15/04/2023 1:28Pm
ဘောက်ချာ နံပါတ်:           13284159
၁ SU1 YOMA SPECIAL 330ML Ks 1,300
(ကန်ပက်)
၂ SU1 CHANG CLASSIC BEER Ks 4,200
၅၀၀ML @ ၂၁၀၀

အပြည့်အစုံ
စုစုပေါင်း: (လက်ခံရရှိသောပမာဏ) Ks 5,500
အခွန်ပမာဏ                Ks 0
အလက်ထရောနစ်            Ks 5,500
ငှားရမည့် ငွေပမာဏ: ငွေဖြင့်   KS 6,000

ကျေးဇူးတင်ပါရှိသည်။
City Express လိုသူများအတွက် ဆက်သွယ်ရန်
""";

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    final pixelRatio = 1.1 * 348.0 / (_width - 40.0); //width - both_padding

    _printWidgetController = PrintWidgetController(pixelRatio: pixelRatio);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          actions: [
            IconButton(
              onPressed: loadData,
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Running on: $_platformVersion\n'),
                  Text('Printer SNI: $_deviceId\n'),
                  Text('Printer TIDSN: $_deviceTidsn\n'),
                  Text('Status: ${_status?.name}\n'),
                  Text('Temp: $_temp\n'),

                  /// SET GREY
                  const Text('Set Grey'),
                  Slider(
                    min: GreyValue.min * 1.0,
                    max: GreyValue.max * 1.0,
                    value: _currentGreyValue * 1.0,
                    onChanged: (level) async {
                      final nextLevel = level.ceil(); // to int

                      // update if only differ
                      if (nextLevel == _currentGreyValue) return;

                      await UrovoPrinter.setGreyLevel(nextLevel);
                      _currentGreyValue = level.ceil();
                      setState(() {});
                    },
                  ),

                  /// SET SPEED
                  const Text('Set Speed'),
                  Slider(
                    min: SpeedValue.min * 1.0,
                    max: SpeedValue.max * 1.0,
                    value: _currentSpeedValue * 1.0,
                    onChanged: (level) async {
                      final nextLevel = level.ceil(); // to int

                      // update if only differ
                      if (nextLevel == _currentSpeedValue) return;

                      await UrovoPrinter.setSpeedLevel(nextLevel);
                      _currentSpeedValue = level.ceil();
                      setState(() {});
                    },
                  ),

                  /// EXAMPLE OF PRINT TEXT
                  OutlinedButton(
                    onPressed: _printText,
                    child: const Text('Text Print'),
                  ),
                  TextFormField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      isCollapsed: true,
                    ),
                    maxLines: 5,
                    maxLength: 1000,
                  ),

                  /// EXAMPLE OF PRINT IMAGE
                  OutlinedButton(
                    onPressed: _printWidget,
                    child: const Text('Widget Print'),
                  ),

                  /// VOCHER WIDGET
                  PrintWidget(
                    controller: _printWidgetController,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'City Express(1001045)',
                            style: TextStyle(fontSize: _printFontSize),
                          ),
                          const Text(
                            'No.353, R-4, Maharbandula Rd,(7)Qr',
                            style: TextStyle(fontSize: _printFontSize),
                          ),
                          const Text(
                            'Kyauktada, Open Daily 24 Hour',
                            style: TextStyle(fontSize: _printFontSize),
                          ),
                          const SizedBox(height: 24.0),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '01/NTH',
                                style: TextStyle(fontSize: _printFontSize),
                              ),
                              Text(
                                '15/04/2023 1:28 PM',
                                style: TextStyle(fontSize: _printFontSize),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Ref No : 136546864',
                                style: TextStyle(fontSize: _printFontSize),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24.0),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 30.0,
                                child: Text(
                                  '1',
                                  style: TextStyle(fontSize: _printFontSize),
                                ),
                              ),
                              const Text(
                                'SUI YOMA SPECIAL 330ML',
                                style: TextStyle(fontSize: _printFontSize),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 70,
                                child: Row(
                                  children: const [
                                    Text(
                                      'Ks',
                                      style:
                                          TextStyle(fontSize: _printFontSize),
                                    ),
                                    Spacer(),
                                    Text(
                                      '1,300',
                                      style:
                                          TextStyle(fontSize: _printFontSize),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              SizedBox(width: 30.0),
                              Text(
                                '(CAN)',
                                style: TextStyle(fontSize: _printFontSize),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 30.0,
                                child: Text(
                                  '2',
                                  style: TextStyle(fontSize: _printFontSize),
                                ),
                              ),
                              const Text(
                                'SUI CHANG BEER 500ML',
                                style: TextStyle(fontSize: _printFontSize),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 70,
                                child: Row(
                                  children: const [
                                    Text(
                                      'Ks',
                                      style:
                                          TextStyle(fontSize: _printFontSize),
                                    ),
                                    Spacer(),
                                    Text(
                                      '1,300',
                                      style:
                                          TextStyle(fontSize: _printFontSize),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              SizedBox(width: 30.0),
                              Text(
                                '(CAN)',
                                style: TextStyle(fontSize: _printFontSize),
                              ),
                            ],
                          ),
                          Container(
                            height: 1.0,
                            width: _width - 30.0,
                            color: Colors.black,
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 30.0,
                                child: Text(
                                  'Tax',
                                  style: TextStyle(fontSize: _printFontSize),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 70,
                                child: Row(
                                  children: const [
                                    Text(
                                      'Ks',
                                      style:
                                          TextStyle(fontSize: _printFontSize),
                                    ),
                                    Spacer(),
                                    Text(
                                      '300',
                                      style:
                                          TextStyle(fontSize: _printFontSize),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                child: Text(
                                  'Container Charges',
                                  style: TextStyle(fontSize: _printFontSize),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 70,
                                child: Row(
                                  children: const [
                                    Text(
                                      'Ks',
                                      style:
                                          TextStyle(fontSize: _printFontSize),
                                    ),
                                    Spacer(),
                                    Text(
                                      '200',
                                      style:
                                          TextStyle(fontSize: _printFontSize),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                child: Text(
                                  'Delivery Charges',
                                  style: TextStyle(fontSize: _printFontSize),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 70,
                                child: Row(
                                  children: const [
                                    Text(
                                      'Ks',
                                      style:
                                          TextStyle(fontSize: _printFontSize),
                                    ),
                                    Spacer(),
                                    Text(
                                      '300',
                                      style:
                                          TextStyle(fontSize: _printFontSize),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
