import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Test extends StatefulWidget {
  @override
  TestState createState() => new TestState();
}

class TestState extends State {
  Geolocator _geolocator;
  Position _position;
  GoogleMapController _controller;

  // void checkPermission() async{
  //   await _geolocator.checkGeolocationPermissionStatus().then((status) {
  //     print('status: $status');
  //   });
  //   await _geolocator
  //       .checkGeolocationPermissionStatus(
  //           locationPermission: GeolocationPermission.locationAlways)
  //       .then((status) {
  //     print('always status: $status');
  //   });
  //   _geolocator.checkGeolocationPermissionStatus(
  //       locationPermission: GeolocationPermission.locationWhenInUse)
  //     ..then((status) {
  //       print('whenInUse status: $status');
  //     });
  // }

  @override
  void initState() {
    super.initState();

    _geolocator = Geolocator();
    LocationOptions locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1);

    // checkPermission();
       updateLocation();

    StreamSubscription positionStream = _geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      _position = position;
    });
  }

  void updateLocation() async {
    try {
      Position newPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .timeout(new Duration(seconds: 5));
          LatLng latLng = new LatLng (newPosition.latitude,newPosition.longitude);
          

      setState(() {
        _position = newPosition;
        CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(latLng, 15);
          _controller.animateCamera(cameraUpdate);
      
      });
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(target:LatLng(6.480763, 80.129632),zoom: 13.0),
            onMapCreated: (GoogleMapController controller){
              _controller = controller;
            }
          ),
          FloatingActionButton(
            child: Icon(Icons.my_location),
            onPressed: (){
              updateLocation();
            },
          ),
        ],
      )
    );
  }
}
