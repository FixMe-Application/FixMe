import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(25),
        color:Colors.white54,
      ),
      padding: EdgeInsets.all(21.0),  
    );
  }
}