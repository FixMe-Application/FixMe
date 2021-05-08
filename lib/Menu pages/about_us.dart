import 'package:fix_me_app/sizeConfig.dart';
import 'package:fix_me_app/widgets/header.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          title: Text(
            "About Us",
            style: TextStyle(
                fontSize: SizeConfig.screenWidth / 15,
                color: Colors.yellow[700]),
            textAlign: TextAlign.center,
          )),
      body: Container(
        color: Colors.grey[700],
        height: SizeConfig.screenHeight,
        child: Column(
          children: <Widget>[
            Center(
              heightFactor: 1.25,
              child: Container(
                width: SizeConfig.screenHeight / 4,
                height: SizeConfig.screenHeight / 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/image-front.png")),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.screenHeight / 40),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.justify,
              ),
            ),
            Expanded(
              child: SizedBox(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight / 10,
                child: _myListView(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _myListView(BuildContext context) {
  final titles = [
    'Email',
    'Contact Us - Customers',
    'Contact Us - Service Providers'
  ];

  final subTitles = ['fixme@gmail.com', '+94 112280780', '+94 112280790'];

  final icons = [Icons.email, Icons.phone, Icons.phone];

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Icon(icons[index], size: SizeConfig.screenHeight / 20),
          title: Text(
            titles[index],
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.screenHeight / 40),
          ),
          subtitle: Text(subTitles[index]),
        ),
      );
    },
  );
}
