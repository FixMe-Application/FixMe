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
               Icons.arrow_back,
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
       body: Container(
         child: Column(
           children: <Widget>[
             Center(
               heightFactor: 1.5,
               child: Container(
                 width: 150.0,
                 height: 150.0,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   image: DecorationImage(
                     fit: BoxFit.fill,
                     image: AssetImage(
                       "assets/images/image-front.png"
                     )
                   ),
                 ),
               ),
             ),
             
           ],
         ),
       ),
    );
  }
}
