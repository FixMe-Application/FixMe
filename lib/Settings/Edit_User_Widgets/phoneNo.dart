import 'package:flutter/material.dart';

class PhoneNo extends StatelessWidget {
  final phoneNo = "xxxxxxxxxx";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text('Phone Number',
              style: TextStyle(fontWeight: FontWeight.w500)),
          subtitle:
              Text(phoneNo, style: TextStyle(fontWeight: FontWeight.w500)),
          trailing: Icon(
            Icons.navigate_next,
            color: Colors.blue[500],
          ),
          onTap: () {
            var router = new MaterialPageRoute(builder: (BuildContext context) {
              return Container(
                  //code for change no
                  );
            });

            Navigator.of(context).push(router);
          }),
    );
  }
}
