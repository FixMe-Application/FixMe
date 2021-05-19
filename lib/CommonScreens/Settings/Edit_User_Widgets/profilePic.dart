import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CircleAvatar(
      radius: 75,
      backgroundImage: null,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.blueAccent,
      //code for change dp
    ));
  }
}
