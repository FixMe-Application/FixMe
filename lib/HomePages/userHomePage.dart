import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../getStart.dart';

class UserHomePage extends StatefulWidget {
  UserHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: new Drawer(
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white)),
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.black87,
                  Color.fromARGB(255, 3, 27, 47).withOpacity(0.8),
                ],
              ),
            ),
            accountName: new Text('Raja'),
            accountEmail: new Text('testemail@test.com'),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
            ),
            
        
            
            
          ),

          CustomListTile(Icons.calendar_today,'My Task',()=>{}),
          CustomListTile(Icons.payment,'Payment',()=>{}),
          CustomListTile(Icons.settings,'Settings',()=>{}),
          CustomListTile(Icons.info,'About Us',()=>{}),
          CustomListTile(Icons.help,'Help',()=>{}),
         
        ]),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: EdgeInsets.all(5),
            child: GestureDetector(
                onTap: () => {print("Message icon clicked")},
                child: Icon(
                  Icons.sms,
                  size: 25,
                )),
          )
        ],
        iconTheme: IconThemeData(
          size: 30.0,
          color: Color.fromARGB(255, 3, 27, 47).withOpacity(0.8),
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: LatLng(6.4204138, 80.0049826), zoom: 15.00),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {print("Tapped on floating button")},
        child: Icon(
          Icons.my_location,
        ),
        backgroundColor: Color.fromARGB(255, 3, 27, 47).withOpacity(0.8),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {

  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon,this.text,this.onTap);

  @override
  Widget build(BuildContext context) {
    
    

    
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child:Container(
        decoration: BoxDecoration(
          // color: Color.fromARGB(255, 3, 27, 47).withOpacity(0.8),
          border: Border(bottom: BorderSide(color: Colors.white)),
        ),
        child: InkWell(
          splashColor: Colors.blue[400],

          onTap: onTap,
          child: Container(
            height: 50,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                 Icon(icon),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(fontSize:16.0)
              )

            )
                
              ],
            ),
            Icon(Icons.arrow_right)
           


        ],),

        

          )

          

        ),
      )
      
    );
  }

  
}
