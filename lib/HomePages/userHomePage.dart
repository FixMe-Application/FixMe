import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../getStart.dart';
import 'sideNav.dart';
import 'package:geolocator/geolocator.dart';

class UserHomePage extends StatefulWidget {
  UserHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  GoogleMapController _controller;
  Position _position;
  Geolocator _geolocator;
  // StreamSubscription _streamSubscription;
  Set<Marker> _marker = {};

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
          CustomListTile(Icons.calendar_today, 'My Task', () => {}),
          CustomListTile(Icons.payment, 'Payment', () => {}),
          CustomListTile(Icons.settings, 'Settings', () => {}),
          CustomListTile(Icons.info, 'About Us', () => {}),
          CustomListTile(Icons.help, 'Help', () => {}),
          CustomListTile(Icons.input, 'Logout', () => {})
        ]),
      ),
      appBar: appBarWidget(),
      body: Stack(
        children: <Widget>[mapWidget()],
      ),
      bottomNavigationBar: buttonBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          getCurrentLocation(),
        },
        child: Icon(
          Icons.my_location,
        ),
        backgroundColor: Color.fromARGB(255, 3, 27, 47).withOpacity(0.8),
      ),
    );
  }

  Widget mapWidget() {
    return GoogleMap(
      mapType: MapType.normal,
      markers: _marker,
      initialCameraPosition:
          CameraPosition(target: LatLng(6.480763, 80.129632), zoom: 14.0),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
    );
  }

  Widget appBarWidget() {
    return AppBar(
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
    );
  }

  getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      Position newPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      LatLng latLng = new LatLng(newPosition.latitude, newPosition.longitude);
      setState(() {
        _position = newPosition;
        CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(latLng, 14.0);
        _controller.animateCamera(cameraUpdate);
      });

      this.setState(() {
        Marker myLocation = Marker(
            markerId: MarkerId("Home"),
            position: LatLng(_position.latitude, _position.longitude),
            icon: BitmapDescriptor.fromBytes(imageData),
            infoWindow: InfoWindow(title: "Home"));

        _marker.add(myLocation);
      });

      //     if (_streamSubscription != null) {
      //   _streamSubscription.cancel();
      // }

      // var _geolocator = Geolocator();
      // var locationOptions =
      //     LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

      // StreamSubscription<Position> _streamSubscription = _geolocator
      //     .getPositionStream(locationOptions)
      //     .listen((Position position) {
      //       setState(() {
      //         _position = position;
      //          CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(
      //          );

      //       });

      // });
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/currentLocation.png");
    return byteData.buffer.asUint8List();
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Widget buttonBar() {
    
    return ButtonBar(
      
      children: <Widget>[
        new Container(
          margin: EdgeInsets.all(10),
          height: 180,
          width: 170,
          child: RaisedButton(
            onPressed: () {},
            child: Column(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.all(10),
                  height: 130,
                  width: 170,
                  child: new Image.asset("assets/breakdown_btn.png"),
                  color: Color.fromARGB(255, 3, 27, 47),
                ),
                new Text(
                  'Break Down',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        new Container(
          margin: EdgeInsets.all(10),
          height: 180,
          width: 170,
          child: RaisedButton(
            onPressed: () {},
            child: Column(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.all(10),
                  height: 130,
                  width: 170,
                  child: new Image.asset("assets/fuelempty_btn.png"),
                  color: Colors.grey,
                ),
                new Text('Fuel Empty', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
