import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key, @required this.document}) : super(key: key);

  final DocumentSnapshot document;
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: new Text(widget.document['name']),
          ),
          body: new TabBarView(children: [
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("Date : ${widget.document['date']}"),
                new Text("Votes : ${widget.document['votes']}"),
                new Hero(
                  tag: 'imageHero',
                  child: Image.network(
                    'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
                  ),
                ),
                new RaisedButton(
                    child: Text("CLOSE"),
                    onPressed: () {
                      Navigator.pop(context, "CLOSED");
                    })
              ],
            ),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ]),
        ));
  }
}
