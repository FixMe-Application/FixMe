import 'package:fix_me_app/Login/login.dart';
import 'package:fix_me_app/Register/Register-Fuel.dart';
import 'package:fix_me_app/Register/Register-Garage.dart';
import 'package:fix_me_app/Register/Register-User.dart';
import 'package:fix_me_app/getStart.dart';
import './Register/register.dart';
import 'package:flutter/material.dart';
import 'HomePages/userHomePage.dart';
import './test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FixMe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:UserHomePage(),
    );
  }
}
