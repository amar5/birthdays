import 'package:birthdays/stateless/color-override.dart';
import 'package:birthdays/stateless/fancy-button.dart';
import 'package:birthdays/stateless/logo.dart';
import 'package:birthdays/styles/main-style.dart';
import 'package:birthdays/supplemental/cut_corners_border.dart';
import 'package:flutter/material.dart';

class Walkthrough extends StatefulWidget {
  @override
  _Walkthrough createState() => _Walkthrough();
}

class _Walkthrough extends State<Walkthrough> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(),
          ),
          new Text(
            "Walkthrough",
            style: Theme.of(context).textTheme.headline,
          ),
          SizedBox(
            height: 50.0,
          ),
          LogoIcon(),
          Expanded(
            child: SizedBox(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FancyButton(
                onPressed: () {
                  print("NEXT");
                },
                label: "Next",
              ),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          Expanded(
            child: SizedBox(),
          ),
        ],
      )),
    );
  }
}
