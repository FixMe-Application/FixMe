import 'package:fix_me_app/views/menu%20pages/about_us.dart';
import 'package:fix_me_app/views/menu%20pages/add_credit_card.dart';
import 'package:fix_me_app/views/menu%20pages/payments_settings.dart';
import 'package:fix_me_app/views/menu%20pages/tasks.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: AddCard(),
    );
  }
}

