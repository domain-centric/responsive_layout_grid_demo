import 'dart:async';

import 'package:flutter/material.dart';

/// A container the shrinks and grows automatically in width
class AnimatedWidthBox extends StatefulWidget {
  final Widget child;

  const AnimatedWidthBox({Key? key, required this.child}) : super(key: key);

  @override
  State<AnimatedWidthBox> createState() => _AnimatedWidthBoxState();
}

class _AnimatedWidthBoxState extends State<AnimatedWidthBox> {
  static const double step = 2;
  static const double minWidth = 300;

  double width = minWidth;
  bool increasing = true;

  _AnimatedWidthBoxState() {
    width = minWidth;
    Timer.periodic(
        const Duration(milliseconds: 10),
        (Timer t) => setState(() {
              width = increasing ? width + step : width - step;
              if (width > MediaQuery.of(context).size.width - step) {
                increasing = false;
              }
              if (width < minWidth) {
                increasing = true;
              }
            }));
  }

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints.tightFor(width: width),
              child: widget.child,
            )),
      );
}
