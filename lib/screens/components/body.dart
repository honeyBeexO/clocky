import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'time_in_hour_minute.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Houari Boumedien Airport, DZA | PST',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TimeInHourAndMinute(),
          Clock(),
        ],
      ),
    );
  }
}

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();
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
          child: CustomPaint(
            painter: ClockPainter(context: context, dateTime: _dateTime),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;
  ClockPainter({this.context, this.dateTime});
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);
    double radius = min(centerX, centerY);

    //Lines: sec
    Paint secHandBrush = Paint()
      ..color = Theme.of(context).primaryColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    // // 60sec ==> 360deg
    // //1sec ==> 360/60 == 6deg
    double secHandX = centerX + 100 * cos(dateTime.second * 6 * pi / 180);
    double secHandY = centerX + 100 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    // //Lines: min
    Paint minPaintBrush = Paint()
      ..color = Theme.of(context).accentColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    double minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    double minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minPaintBrush);
    //Lines: hours
    Paint hourPaintBrush = Paint()
      ..color = Theme.of(context).colorScheme.secondary
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    // //12h --> 360deg, 1h --> 30deg, 1min --> 0.5deg
    double hourHandX = centerX +
        80 * cos((dateTime.minute * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourHandY = centerX +
        80 * sin((dateTime.minute * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourPaintBrush);

    Paint dotPainter = Paint()
      ..color = Theme.of(context).primaryIconTheme.color;

    canvas.drawCircle(center, 24.0, dotPainter);
    canvas.drawCircle(
        center, 23, Paint()..color = Theme.of(context).backgroundColor);
    canvas.drawCircle(center, 10, dotPainter);

    //codex way
    // Paint fillBrush = Paint()..color = Color(0xff444974);
    // Paint outlineBrush = Paint()
    //   ..color = Color(0xffeaecff)
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 16;
    // Paint centerDotBrush = Paint()..color = Color(0xffeaecff);

    // Paint secHandBrush = Paint()
    //   ..color = Colors.orange[300]
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round
    //   ..strokeWidth = 10;
    // Paint minHandBrush = Paint()
    //   ..shader = LinearGradient(colors: [Colors.lightBlue, Colors.pink])
    //       .createShader(Rect.fromCircle(center: center, radius: radius))
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round
    //   ..strokeWidth = 10;
    // Paint hoursHandBrush = Paint()
    //   ..shader = LinearGradient(colors: [Colors.pink, Colors.lightBlue])
    //       .createShader(Rect.fromCircle(center: center, radius: radius))
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round
    //   ..strokeWidth = 10;

    // canvas.drawCircle(center, radius - 40, fillBrush);
    // canvas.drawCircle(center, radius - 40, outlineBrush);
    // // 60sec ==> 360deg
    // //1sec ==> 360/60 == 6deg
    // double secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    // double secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    // canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    // double minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    // double minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    // canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    // //12h --> 360deg, 1h --> 30deg, 1min --> 0.5deg
    // double hourHandX = centerX +
    //     80 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    // double hourHandY = centerX +
    //     80 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    // canvas.drawLine(center, Offset(hourHandX, hourHandY), hoursHandBrush);

    // canvas.drawCircle(center, 16, centerDotBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
