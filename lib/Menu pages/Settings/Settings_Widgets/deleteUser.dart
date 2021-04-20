import 'package:fix_me_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import '../settings.dart';

class DeleteUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      child: ListTile(
          title: Text('Delete my account',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.screenHeight / 30)),
          leading: Icon(
            Icons.delete,
            color: Colors.lightBlue[900],
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
