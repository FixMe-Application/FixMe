
import 'package:flutter/material.dart';

import '../settings.dart';

class LogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text('Logout', style: TextStyle(fontWeight: FontWeight.w500)),
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.blue[500],
          ),
          onTap: () {
            var router = new MaterialPageRoute(builder: (BuildContext context) {
              return Settings();
            });

            Navigator.of(context).push(router);
          }),
    );
  }
}
