import 'package:flutter/material.dart';
import 'clock.dart';
import 'country_card.dart';
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CountryCard(
                    image: 'assets/icons/Liberty.svg',
                    time: '10:24',
                    timeZone: '+3HRS | EST',
                    period: 'PM',
                  ),
                  CountryCard(
                    image: 'assets/icons/Sydney.svg',
                    location: 'Sydeny, Australia',
                    time: '16:24',
                    timeZone: '-7HRS | EST',
                    period: 'PM',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
