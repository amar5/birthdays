import 'package:birthdays/stateless/color-override.dart';
import 'package:birthdays/stateless/logo.dart';
import 'package:birthdays/styles/main-style.dart';
import 'package:birthdays/supplemental/cut_corners_border.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleNextClick() {
    print("NEXT");
    Navigator.pushReplacementNamed(context, '/');
  }

  void _handleCancelClick() {
    _usernameController.clear();
    _passwordController.clear();
    print("Cancel");
  }

  void _handleSkipClick() {
    Navigator.of(context).pushNamed('/walkthrough');
    print("SKIP");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(),
          ),
          Column(
            children: <Widget>[
              LogoIcon(),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'BIRTHDAY REMINDER',
                style: Theme.of(context).textTheme.headline,
              ),
              Text(
                'Never forget a birthday',
                style: Theme.of(context).textTheme.body1,
              )
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
//          SizedBox(height: 1.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: <Widget>[
                PrimaryColorOverride(
                  color: kShrineBrown900,
                  child: TextField(
                    decoration: InputDecoration(
                        border: CutCornersBorder(),
                        filled: false,
                        labelText: 'Username'),
                    controller: _usernameController,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                PrimaryColorOverride(
                  color: kShrineBrown900,
                  child: TextField(
                    decoration: InputDecoration(
                        border: CutCornersBorder(),
                        filled: false,
                        labelText: 'Password'),
                    controller: _passwordController,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text("Cancel"),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  onPressed: _handleCancelClick,
                ),
                RaisedButton(
                  child: Text("Next"),
                  elevation: 8.0,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  onPressed: _handleNextClick,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text(
                  "Skip",
                  style: Theme.of(context).textTheme.caption,
                ),
                onPressed: _handleSkipClick,
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
