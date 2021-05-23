import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fix_me_app/Driver/HomePage/DriverHomePagePrimary.dart';
import 'package:fix_me_app/FuelOwner/HomePage/FuelHomePage2.dart';
import 'package:fix_me_app/Mechanic/HomePage/MechanicHomePage2.dart';
import 'package:fix_me_app/Widgets/Authentication/Services/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Widgets/Authentication/Login/Login.dart';
import 'Widgets/Models/User.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print("...............................$user");
    if (user != null) {
      return FutureBuilder<DocumentSnapshot>(
          future: getUserType(user.uid),
          builder: (context, userType) {
            print(userType);
            if (userType?.data['userType'] == 'As a Driver') {
              print(userType.data['userType']);
              return DriverHomePagePrimary();
            } else if (userType.data['userType'] == 'As a Mechanic') {
              print(userType.data['userType']);
              return MechanicHomePage2();
            } else {
              print(userType.data['userType'] == 'As a Fuel Supplier');
              return FuelHomePage2();
            }
          });
    } else {
      return Login();
    }

    // if (user == null) {
    //   return Login();
    // } else {
    //   DriverHomePagePrimary();
    // }
  }
}
