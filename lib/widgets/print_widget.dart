import 'package:flutter/material.dart';

import 'print_controller.dart';

class PrintWidget extends StatelessWidget {
  final Widget? child;
  final PrintWidgetController controller;

  const PrintWidget({
    Key? key,
    required this.child,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// to capture widget to image by GlobalKey in RepaintBoundary
    return RepaintBoundary(
      key: controller.containerKey,
      child: child,
    );
  }
}
