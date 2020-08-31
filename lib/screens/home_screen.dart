import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Theme.of(context).bottomAppBarTheme.color,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                'assets/icons/clock.svg',
                height: 20,
                width: 20,
                color: Theme.of(context).iconTheme.color,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/world.svg',
                    height: 24,
                    width: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'World'.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              SvgPicture.asset(
                'assets/icons/watch_2.svg',
                height: 20,
                width: 20,
                color: Theme.of(context).iconTheme.color,
              ),
              SvgPicture.asset(
                'assets/icons/stop_watch.svg',
                height: 20,
                width: 20,
                color: Theme.of(context).iconTheme.color,
              ),
            ],
          ),
        ),
      ),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/Settings.svg',
          color: Theme.of(context).iconTheme.color,
        ),
        onPressed: () {},
      ),
      actions: [
        buildAddButton(context),
      ],
    );
  }

  Padding buildAddButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
      ),
      child: InkWell(
        onTap: () => print('tapped'),
        child: Container(
          width: getProportionateScreenWidth(32.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
