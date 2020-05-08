import 'package:flutter/material.dart';
import '../settings.dart';

class DeleteUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text('Delete my account',
              style: TextStyle(fontWeight: FontWeight.w500)),
          leading: Icon(
            Icons.delete,
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
