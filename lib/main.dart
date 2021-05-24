import 'package:fix_me_app/DataHandler/AppData.dart';
import 'package:fix_me_app/Driver/HomePage/DriverHomePagePrimary.dart';
import 'package:fix_me_app/Widgets/Authentication/Login/Login.dart';
import 'package:fix_me_app/Widgets/Authentication/Register/Register.dart';

import 'Wrapper.dart';
import 'package:fix_me_app/Widgets/Models/User.dart';
import 'package:fix_me_app/Widgets/Authentication/Services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (context) => AppData(),
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'FixMe App',
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//           ),
//           home: Wrapper(),
//           initialRoute: Wrapper.idScreen,
//           routes: {
//             Login.idScreen: (context) => Login(),
//             Register.idScreen: (context) => Register(),
//             Wrapper.idScreen: (context) => Wrapper(),
//             DriverHomePagePrimary.idScreen: (context) =>
//                 DriverHomePagePrimary(),
//           },
//         ));
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FixMe App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Wrapper(),
        ));
  }
}
