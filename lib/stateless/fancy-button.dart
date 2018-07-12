import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String label;
  FancyButton({@required this.label, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new RawMaterialButton(
        fillColor: Theme.of(context).accentColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Row(
            children: <Widget>[
              new Icon(
                Icons.next_week,
                color: Colors.white,
              ),
              new Text(
                this.label,
                style: Theme
                    .of(context)
                    .textTheme
                    .apply(bodyColor: Colors.white)
                    .headline,
              ),
            ],
          ),
        ),
        shape: StadiumBorder(),
        onPressed: onPressed);
  }
}
