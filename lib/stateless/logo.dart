import 'package:flutter/material.dart';

class LogoIcon extends StatelessWidget {
  // final Color IconColor;
  final double iconSize;

  LogoIcon({this.iconSize = 80.0});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.add_alarm,
      // color: Theme.of(context).primaryColor,
      size: iconSize,
    );
  }
}
