import 'package:fix_me_app/sizeConfig.dart';
import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  final name = "xxxxxxx";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      child: ListTile(
          title: Text('Name',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.screenHeight / 30)),
          subtitle: Text(name,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.screenHeight / 30)),
          trailing: Icon(
            Icons.navigate_next,
            color: Colors.lightBlue[900],
          ),
          onTap: () {
            var router = new MaterialPageRoute(builder: (BuildContext context) {
              return Container(
                  //code for change name
                  );
            });

            Navigator.of(context).push(router);
          }),
    );
  }
}
