import 'package:flutter/material.dart';
import 'package:deliver_grocery/actions/login.dart';
import 'package:deliver_grocery/views/homepage.dart';
//import 'package:deliver_grocery/';

void main() {
  runApp(new MaterialApp(
    theme: ThemeData(fontFamily: 'IndieFlower'),
    home: new Login(),
//    routes: routes,
  ));
}
