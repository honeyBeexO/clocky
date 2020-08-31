import 'package:flutter/material.dart';
import '../../size_config.dart';
import 'clock.dart';
import 'time_in_hour_minute.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Houari Boumedien Airport, DZA | PST',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 30.0),
            TimeInHourAndMinute(),
            Spacer(),
            Clock(),
            Spacer(),
            SizedBox(
              width: getProportionateScreenWidth(233),
              child: AspectRatio(
                aspectRatio: 1.33,
                child: Container(
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
