import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.lightBlue,
           leading: IconButton(
             icon: Icon(
               Icons.arrow_back_ios,
               color: Colors.white,
             ),
             onPressed: (){
               
             },
           ),
         title: Text(
           "About Us",
           style: TextStyle(
             fontSize: 20.0,
             color:Colors.white
           ),
         ),
       ),
    );
  }
}
