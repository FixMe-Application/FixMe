import 'package:fix_me_app/CommonScreens/Login/login.dart';

import 'Wrapper.dart';
import 'package:fix_me_app/widgets/authentication/models/user.dart';
import 'package:fix_me_app/widgets/authentication/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          home: Login(),
        ));
  }
}
