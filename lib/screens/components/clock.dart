import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'clock_painter.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();
  Key _key = GlobalKey();
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 64,
                color: kShadowColor.withOpacity(0.14),
              ),
            ],
          ),
          child: Transform.rotate(
            angle: -pi / 2,
            child: CustomPaint(
              painter: ClockPainter(context: context, dateTime: _dateTime),
              willChange: true,
              key: _key,
            ),
          ),
        ),
      ),
    );
  }
}
