import 'dart:async';
import 'dart:typed_data';
import 'package:fix_me_app/Widgets/Authentication/Services/AuthService.dart';
import 'package:fix_me_app/Widgets/Navigation/SideNav.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_polyline/google_map_polyline.dart';

class FuelHomePage2 extends StatefulWidget {
  FuelHomePage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FuelHomePage2State createState() => _FuelHomePage2State();
}

class _FuelHomePage2State extends State<FuelHomePage2> {
  final AuthService _auth = AuthService();
  GoogleMapController _controller;
  Position _position;
  Geolocator _geolocator;
  // StreamSubscription _streamSubscription;
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

  LatLng _originLocation;

  LatLng _destinationLocation = LatLng(6.4204138, 80.0049826);

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
            // currentAccountPicture: new CircleAvatar(
            //   backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
            // ),
          ),
          CustomListTile(Icons.calendar_today, 'My Task', () => {}),
          CustomListTile(Icons.payment, 'Payment', () => {}),
          CustomListTile(Icons.settings, 'Settings', () => {}),
          CustomListTile(Icons.info, 'About Us', () => {}),
          CustomListTile(Icons.help, 'Help', () => {}),
          CustomListTile(
              Icons.input, 'Logout', () async => {await _auth.signOut()})
        ]),
      ),
      appBar: appBarWidget(),
      body: Stack(
        children: <Widget>[mapWidget(), buttonBar()],
      ),
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
        _originLocation = LatLng(_position.latitude, _position.longitude);
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

  Widget buttonBar() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(10),
              height: 180,
              width: 170,
              child: RaisedButton(
                onPressed: () {
                  _getPolylinesWithLocation();
                },
                child: Column(
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.all(10),
                      height: 130,
                      width: 170,
                      child: new Image.asset("assets/navigate_btn.png"),
                      color: Color.fromARGB(255, 3, 27, 47),
                    ),
                    new Text(
                      'Navigate',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
