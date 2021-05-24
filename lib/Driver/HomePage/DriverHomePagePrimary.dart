import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fix_me_app/CommonScreens/Menu%20pages/tasks.dart';
import 'package:fix_me_app/CommonScreens/Settings/settings.dart';
import 'package:fix_me_app/CommonScreens/about_us.dart';
import 'package:fix_me_app/CommonScreens/help.dart';
import 'package:fix_me_app/Config/Config.dart';
import 'package:fix_me_app/Driver/Assistant/AssistantMethods.dart';
import 'package:fix_me_app/Driver/ChatBot/chatbot.dart';
import 'package:fix_me_app/Driver/Payments/Payments-Settings.dart';
import 'package:fix_me_app/Widgets/Authentication/Services/AuthService.dart';
import 'package:fix_me_app/Widgets/Navigation/SideNav.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_polyline/google_map_polyline.dart';

class DriverHomePagePrimary extends StatefulWidget {
  DriverHomePagePrimary({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DriverHomePagePrimaryState createState() => _DriverHomePagePrimaryState();
}

class _DriverHomePagePrimaryState extends State<DriverHomePagePrimary> {
  GoogleMapController _controller;
  Position _position;
  Geolocator _geolocator;
  // StreamSubscription _streamSubscription;
  final AuthService _auth = AuthService();
  Set<Marker> _marker = {};
  int _polylineCount = 1;
  Map<PolylineId, Polyline> _polylines = <PolylineId, Polyline>{};
  GoogleMapPolyline _googleMapPolyline =
      new GoogleMapPolyline(apiKey: "AIzaSyBfeLPhKwrbyaQaCfe1W3qH9B-uz26lMRw");

  //Polyline patterns
  List<List<PatternItem>> patterns = <List<PatternItem>>[
    <PatternItem>[], //line
    <PatternItem>[PatternItem.dash(30.0), PatternItem.gap(20.0)], //dash
    <PatternItem>[PatternItem.dot, PatternItem.gap(10.0)], //dot
    <PatternItem>[
      //dash-dot
      PatternItem.dash(30.0),
      PatternItem.gap(20.0),
      PatternItem.dot,
      PatternItem.gap(20.0)
    ],
  ];

  LatLng _originLocation = LatLng(7.182490, 79.895399);

  LatLng _destinationLocation = LatLng(6.9728, 79.9161);

  DatabaseReference driverSideRequestReference;

  _getPolylinesWithLocation() async {
    List<LatLng> _coordinates =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _originLocation,
            destination: _destinationLocation,
            mode: RouteMode.driving);

    setState(() {
      _polylines.clear();
    });
    _addPolyline(_coordinates);
  }

  _addPolyline(List<LatLng> _coordinates) {
    PolylineId id = PolylineId("poly$_polylineCount");
    Polyline polyline = Polyline(
        polylineId: id,
        patterns: patterns[0],
        color: Colors.blueAccent,
        points: _coordinates,
        width: 5,
        onTap: () {});

    setState(() {
      _polylines[id] = polyline;
      _polylineCount++;
    });
  }

  @override
  void initState() {
    super.initState();
    AssistantMethods.getCurrentOnlineUserInfo();
  }

  Widget saveDriverSideRequest() {
    driverSideRequestReference =
        FirebaseDatabase.instance.reference().child("DriverSideRequest").push();

    Map destinationLocationMap = {
      // "latitude": _destinationLocation.latitude.toString(),
      // "longitude": _destinationLocation.longitude.toString()
      "latitude": "6.574",
      "longitude": "79.43"
    };

    Map originLocationMap = {
      "latitude": _originLocation.latitude.toString(),
      "longitude": _originLocation.longitude.toString()
    };

    Map requestInfoMap = {
      "driverId": "waiting",
      "originLocation": originLocationMap,
      "destinationLocation": destinationLocationMap,
      "createdAt": DateTime.now().toString(),
      "driverName": userCurrentInfo.name,
      "driverPhone": userCurrentInfo.phone
    };

    driverSideRequestReference.set(requestInfoMap);
  }

  void cancelRequest() {
    driverSideRequestReference.remove();
  }

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
              accountName: new Text('Champika'),
              accountEmail: new Text('champikamendis.cm@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
              ),
            ),
            CustomListTile(
                Icons.calendar_today,
                'My Task',
                () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TasksPage()))
                    }),
            CustomListTile(
                Icons.payment,
                'Payment',
                () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentSettings()))
                    }),
            CustomListTile(
                Icons.settings,
                'Settings',
                () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Settings()))
                    }),
            CustomListTile(
                Icons.info,
                'About Us',
                () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AboutPage()))
                    }),
            CustomListTile(
                Icons.help,
                'Help',
                () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Help()))
                    }),
            CustomListTile(
                Icons.input, 'Logout', () async => {await _auth.signOut()})
          ]),
        ),
        appBar: appBarWidget(),
        body: Stack(
          children: <Widget>[mapWidget()],
        ),
        floatingActionButton: Row(children: [
          SizedBox(
            width: 50,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              modalBottomSheetMechanics();
            },
            heroTag: 'floatingBtn1',
            label: const Text('Break Down',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            backgroundColor: Color.fromARGB(255, 3, 27, 47).withOpacity(0.8),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              modalBottomSheetFuel();
            },
            heroTag: 'floatingBtn2',
            label: const Text('Fuel Empty',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            backgroundColor: Color.fromARGB(255, 3, 27, 47).withOpacity(0.8),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () => {
              getCurrentLocation(),
            },
            heroTag: 'floatingBtn3',
            child: Icon(
              Icons.my_location,
            ),
            backgroundColor: Color.fromARGB(255, 3, 27, 47).withOpacity(0.8),
          ),
        ]));
  }

  Widget mapWidget() {
    return GoogleMap(
      mapType: MapType.normal,
      mapToolbarEnabled: false,
      zoomControlsEnabled: false,
      polylines: Set<Polyline>.of(_polylines.values),
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
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatBot()))
                    // builder: (context) => Notifications()))
                  },
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
      Position newPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      LatLng latLng = new LatLng(newPosition.latitude, newPosition.longitude);

      setState(() {
        _position = newPosition;
        _destinationLocation = LatLng(_position.latitude, _position.longitude);
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

  modalBottomSheetFuel() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
            height: 500,
            child: Column(children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text("Empty your Fuel?",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                  child: Text(
                    "Fuel Service to your place",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ])));
  }

  modalBottomSheetMechanics() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
            height: 300,
            child: Column(children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text("Broke your vehical?",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                  child: Text(
                    "Mechanical service to your place",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () async {
                    saveDriverSideRequest();
                    _getPolylinesWithLocation();
                    mechanicRequestModal();
                    Navigator.pop(context);
                    mechanicRequestModal();
                  }),
            ])));
  }

  mechanicRequestModal() {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 40.0,
      fontFamily: 'Horizon',
    );
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
            height: 300,
            child: Column(children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 250.0,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'Please wait...',
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                        ColorizeAnimatedText(
                          'Searching Mechanics',
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                        ColorizeAnimatedText(
                          'Connecting with Mechanics',
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                      ],
                      isRepeatingAnimation: true,
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
              ),
              RaisedButton(
                  child: Text(
                    "Cancel Request",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ])));
  }
}
