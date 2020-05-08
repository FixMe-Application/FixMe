import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  final password = "xxxxxxxxxx";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title:
              Text('Password', style: TextStyle(fontWeight: FontWeight.w500)),
          subtitle:
              Text(password, style: TextStyle(fontWeight: FontWeight.w500)),
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
