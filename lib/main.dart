import 'dart:async';

import 'package:birthdays/calendar.dart';
import 'package:birthdays/details.dart';
import 'package:birthdays/home.dart';
import 'package:birthdays/login.dart';
import 'package:birthdays/settings.dart';
import 'package:birthdays/sign_up/sign_up.dart';
import 'package:birthdays/styles/main-style.dart';
import 'package:birthdays/timeline.dart';
import 'package:birthdays/walkthrough.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  return runApp(new MyApp());
}

/* --- DATETIME ON FIRE BASE ------
* // old:
let date: Date = documentSnapshot.get("created_at") as! Date
// new:
let timestamp: Timestamp = documentSnapshot.get("created_at") as! Timestamp
let date: Date = timestamp.dateValue()
*/
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: GetDefaultTheme(),
      initialRoute: '/login',
      routes: {
        '/': (context) => HomePage(),
        '/walkthrough': (context) => Walkthrough(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUp(),
        '/calendar': (context) => CalendarPage(),
        '/timeline': (context) => TimelinePage(),
        '/settings': (context) => SettingsPage()
      },
      // debugShowCheckedModeBanner: false,
      title: 'Birthdays',
      // home: new MyHomePage(title: 'Birthdays Home Page'),
    );
  }
}
