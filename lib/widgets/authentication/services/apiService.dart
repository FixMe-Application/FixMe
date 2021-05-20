import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:fix_me_app/Widgets/Models/RegisterModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return response.body;
  });
}

Future<void> syncRealtime() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await FirebaseApp.configure(
      name: 'db2',
      options: Platform.isIOS
          ? const FirebaseOptions(
              googleAppID: '1:328233365339:android:8111f3512885222807347e',
              apiKey: 'AIzaSyD0cKap-07fbvdtZOQ0h0bWHOPnAVt1Vig',
              databaseURL: 'https://fixme-app.firebaseio.com/',
            )
          //Fake details for iOS
          : const FirebaseOptions(
              googleAppID: '1:297855924061:ios:c6de2b69b03a5be8',
              gcmSenderID: '297855924061',
              databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
            ));
}
