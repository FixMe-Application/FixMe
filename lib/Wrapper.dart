import 'package:fix_me_app/HomePages/mechanicHomePage2.dart';
import 'package:fix_me_app/HomePages/userHomePage.dart';
import 'package:fix_me_app/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(".......................................$user");

    if (user == null) {
      return Login();
    } else {
      return UserHomePage();
    }
  }
}
