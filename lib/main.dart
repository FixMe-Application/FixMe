import 'package:fix_me_app/authentication/getStart.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FixMe App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetStart(),
    );
  }
}
