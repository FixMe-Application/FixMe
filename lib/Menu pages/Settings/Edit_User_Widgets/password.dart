import 'package:fix_me_app/sizeConfig.dart';
import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  final password = "xxxxxxxxxx";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      child: ListTile(
          title: Text('Password',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.screenHeight / 30)),
          subtitle: Text(password,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.screenHeight / 30)),
          trailing: Icon(
            Icons.navigate_next,
            color: Colors.blue[500],
          ),
          onTap: () {
            var router = new MaterialPageRoute(builder: (BuildContext context) {
              return Container(
                  //code for change password
                  );
            });

            Navigator.of(context).push(router);
          }),
    );
  }
}
