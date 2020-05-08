import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fix_me_app/ui/settings/user.dart';
import 'package:fix_me_app/ui/settings/logOut.dart';
import 'package:fix_me_app/ui/settings/editUser.dart';
import 'package:fix_me_app/ui/settings/deleteUser.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Settings'),
          backgroundColor: Colors.blueAccent,
        ),
        body: new Container(
            child: new Column(children: <Widget>[
          User(),
          EditUser(),
          DeleteUser(),
          LogOut()
        ])));
  }
}
