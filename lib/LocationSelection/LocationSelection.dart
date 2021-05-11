import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationSelection extends StatefulWidget {
  LocationSelection({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LocationSelectionState createState() => _LocationSelectionState();
}

class _LocationSelectionState extends State<LocationSelection> {
  GoogleMapController _controller;
  Position _position;
  Set<Marker> _marker = {};

  LatLng _originLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appBarWidget(),
        body: Stack(
          children: <Widget>[mapWidget()],
        ),
        floatingActionButton: Row(children: [
          SizedBox(
            width: 30,
          ),
          FloatingActionButton.extended(
            onPressed: () {},
            label: const Text('Confirm Location'),
            icon: const Icon(Icons.location_on),
            backgroundColor: Color.fromARGB(255, 3, 27, 47).withOpacity(0.8),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              print("Getting current location...");
              getCurrentLocation();
            },
            label: const Text('Current Location'),
            icon: const Icon(Icons.location_searching_outlined),
            backgroundColor: Color.fromARGB(255, 3, 27, 47).withOpacity(0.8),
          )
        ]));
  }

  Widget mapWidget() {
    return GoogleMap(
      mapType: MapType.normal,
      zoomControlsEnabled: false,
      markers: _marker,
      initialCameraPosition:
          CameraPosition(target: LatLng(6.9271, 79.8612), zoom: 11.0),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
    );
  }

  Widget appBarWidget() {
    return AppBar(
      backgroundColor: Colors.blueGrey[600],
      title: Text('Select your location'),
      elevation: 0.0,
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
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/currentLocation.png");
    return byteData.buffer.asUint8List();
  }
}
