import 'dart:async';

import 'package:flutter/material.dart';

class TimeInHourAndMinute extends StatefulWidget {
  @override
  _TimeInHourAndMinuteState createState() => _TimeInHourAndMinuteState();
}

class _TimeInHourAndMinuteState extends State<TimeInHourAndMinute> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
    print('RE-INIT STATE');
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (_timeOfDay.minute != TimeOfDay.now().minute) {
          setState(() {
            _timeOfDay = TimeOfDay.now();
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
    print('RE_BUILD');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //${_timeOfDay.hour}==> 24h
        //{_timeOfDay.hourOfPeriod ==> 12h
        Text(
          '${_timeOfDay.hour}:${_timeOfDay.minute}',
          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 100),
        ),
        SizedBox(width: 5.0),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            '$_period',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
