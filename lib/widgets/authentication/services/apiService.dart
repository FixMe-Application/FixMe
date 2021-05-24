import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fix_me_app/Widgets/Authentication/Services/AuthService.dart';
import 'package:fix_me_app/Widgets/Models/RegisterModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//Create post request

Future<String> createPost(String url, {Map body}) async {
  http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return response.body;
  });
}

//Sync with firebase realtime
Future<bool> syncRealtime(String uid, String userType, String name,
    String phone, String email) async {
  // final FirebaseApp app = await FirebaseApp.configure(
  //     name: 'db2',
  //     options: Platform.isIOS
  //         ? const FirebaseOptions(
  //             googleAppID: '1:328233365339:android:8111f3512885222807347e',
  //             apiKey: 'AIzaSyD0cKap-07fbvdtZOQ0h0bWHOPnAVt1Vig',
  //             databaseURL: 'https://fixme-app.firebaseio.com/',
  //           )
  //         //Fake details for iOS
  //         : const FirebaseOptions(
  //             googleAppID: '1:297855924061:ios:c6de2b69b03a5be8',
  //             gcmSenderID: '297855924061',
  //             databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
  //           ));

  try {
    WidgetsFlutterBinding.ensureInitialized();
    DatabaseReference userRef =
        FirebaseDatabase.instance.reference().child(userType);

    Map userDataMap = {"name": name, "phone": phone, "email": email};

    userRef.child(uid).set(userDataMap);

    return true;
  } catch (e) {
    return false;
  }
}

Future<DocumentSnapshot> getUserType(String uid) async {
  final Firestore _firestore = Firestore.instance;
  var result = await _firestore.collection("users").document(uid).get();
  print("hellooo this is result..........................");
  print(result);
  return result;
}

Future<DataSnapshot> getCurrentUserFromRDB(String uid, String userType) {
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child(userType).child(uid);
  reference.once().then((DataSnapshot dataSnapshot) {
    if (dataSnapshot.value != null) {
      print(dataSnapshot.value['name']);
      return dataSnapshot;
    }
  });
}
