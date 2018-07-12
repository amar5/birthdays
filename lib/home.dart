import 'dart:async';

import 'package:birthdays/details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  final String title = 'Birthdays Home Page';

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  Future<void> _goToDetails(DocumentSnapshot document) async {
    // await _addVotes(document);

    // var result2 = Navigator.pushNamed(context, '/Details/${document}');
    var result = await Navigator.push(context,
        new MaterialPageRoute<void>(builder: (context) {
      return new DetailsPage(document: document);
    }));
    print("$result");

    // Scaffold.of(context).showSnackBar(SnackBar(content: Text("$result")));
  }

  Future<void> _addVotes(DocumentSnapshot document) async {
    await Firestore.instance.runTransaction((transaction) async {
      var freshap = await transaction.get(document.reference);
      if (document['votes'] != null) {
        await transaction
            .update(freshap.reference, {'votes': freshap['votes'] + 1});
      } else {
        await transaction.update(freshap.reference, {'votes': 1});
      }
// await transaction.update(freshap.reference, {'votes' : freshap['votes'] ? freshap['votes'] + 1 : 0});
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new StreamBuilder(
          stream: Firestore.instance.collection('person').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');

            return new Column(
              children: <Widget>[
                new Expanded(
                    child: new ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        padding: const EdgeInsets.only(top: 10.0),
                        itemExtent: 50.0,
                        itemBuilder: (context, index) => _buildListItem(
                            context, snapshot.data.documents[index]))),
                new Hero(
                  tag: 'imageHero',
                  child: Image.network(
                    'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
                  ),
                ),
              ],
            );
          }),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return new ListTile(
        key: new ValueKey(document.documentID),
        title: new Container(
          decoration: new BoxDecoration(
              border: new Border.all(color: const Color(0x80000000)),
              borderRadius: new BorderRadius.circular(5.0)),
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.only(top: 4.0),
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new Text(
                  document['name'],
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              //new Text( document['date'].toString()),
              new Text(document['votes'].toString()),
              new Icon(
                Icons.chevron_right,
                color: Colors.blue,
              )
            ],
          ),
        ),
        onTap: () => _goToDetails(document));
  }
}
