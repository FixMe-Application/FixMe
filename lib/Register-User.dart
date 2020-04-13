import 'package:flutter/material.dart';

void main() => runApp(MyApp());

void verify(){

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOGIN',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: RegisterUser(),
    );
  }
}
