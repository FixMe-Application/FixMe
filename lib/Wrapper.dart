import 'package:fix_me_app/CommonScreens/Login/login.dart';
import 'package:fix_me_app/Driver/HomePage/userHomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CommonScreens/Settings/Settings_Widgets/user.dart';

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
