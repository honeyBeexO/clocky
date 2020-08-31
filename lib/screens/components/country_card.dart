import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_config.dart';

class CountryCard extends StatelessWidget {
  final String image;
  final String location, timeZone, time, period;
  const CountryCard({
    Key key,
    this.image,
    this.location,
    this.timeZone,
    this.time,
    this.period,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(30)),
      child: SizedBox(
        width: getProportionateScreenWidth(233),
        child: AspectRatio(
          aspectRatio: 1.33,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Theme.of(context).primaryIconTheme.color,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location ?? 'New York, USA',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontSize: getProportionateScreenWidth(20),
                      ),
                ),
                SizedBox(height: 5),
                Text(timeZone ?? '+3HRS | EST'),
                Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(
                      image ?? 'assets/icons/Liberty.svg',
                      width: getProportionateScreenWidth(40),
                      color: Theme.of(context).iconTheme.color,
                    ),
                    Spacer(),
                    Text(
                      time ?? '9:45',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(period ?? 'AM'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
