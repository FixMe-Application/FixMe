import 'package:flutter/material.dart';

class ConfirmationBottomSheet extends StatelessWidget {
  final String title;
  final String description;

  ConfirmationBottomSheet({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              description,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            FlatButton(
              child: Text(
                'Option 01',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                //Add necessary function
              },
            ),
            FlatButton(
              child: Text(
                'Option 02',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
