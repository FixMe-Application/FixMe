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
               heightFactor: 1.25,
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
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0
                ),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.justify,
              ),
            ),
           ],
         ),
       ),
    );
  }
}
