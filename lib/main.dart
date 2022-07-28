// @dart=2.9

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:test_app_finteg/view/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fintegra Homido Indonesia',
      home: HomePage(),
    );
  }
}
