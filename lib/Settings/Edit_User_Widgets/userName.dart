import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  final name = "xxxxxxx";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text('Name', style: TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
          trailing: Icon(
            Icons.navigate_next,
            color: Colors.blue[500],
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
