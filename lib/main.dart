import 'package:fix_me_app/HomePages/userHomePage.dart';
import 'package:fix_me_app/LocationSelection/LocationSelection.dart';
import 'package:fix_me_app/Login/login.dart';
import 'package:fix_me_app/getStart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Wrapper.dart';
import 'authentication/models/user.dart';
import 'authentication/services/authService.dart';
import './Register/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'FixMe App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home: Wrapper(),
            home: LocationSelection()));
  }
}
