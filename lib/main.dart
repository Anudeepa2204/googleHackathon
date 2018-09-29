import 'package:flutter/material.dart';
import 'package:deliver_grocery/views/login.dart';
import 'package:deliver_grocery/routes/routes.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'IndieFlower'),
    home: new Login(),
    routes: routes,
  ));
}
