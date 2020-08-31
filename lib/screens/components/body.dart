import 'package:flutter/material.dart';
import 'clock.dart';
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
          SizedBox(height: 30.0),
          TimeInHourAndMinute(),
          SizedBox(height: 50.0),
          Clock(),
        ],
      ),
    );
  }
}
