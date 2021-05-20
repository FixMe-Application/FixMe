import 'package:fix_me_app/Driver/HomePage/DriverHomePagePrimary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Widgets/Authentication/Login/Login.dart';
import 'Widgets/Models/User.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(".......................................$user");

    if (user == null) {
      return Login();
    } else {
      return DriverHomePagePrimary();
    }
  }
}
