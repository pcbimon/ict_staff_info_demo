import 'package:flutter/material.dart';
import 'package:ict_staff_info_demo/screens/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICT Staff Information',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Authentication(),
    );
  }
}
