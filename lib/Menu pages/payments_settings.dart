import 'package:fix_me_app/sizeConfig.dart';
import 'package:fix_me_app/widgets/header.dart';
import 'package:flutter/material.dart';

class PaymentSettings extends StatefulWidget {
  @override
  _PaymentSettingsState createState() => _PaymentSettingsState();
}

class _PaymentSettingsState extends State<PaymentSettings> {
  String radioItem = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          title: Text(
            "Payment",
            style: TextStyle(
                fontSize: SizeConfig.screenWidth / 15,
                color: Colors.yellow[700]),
            textAlign: TextAlign.center,
          )),
      body: Container(
        color: Colors.grey[800],
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight / 40),
              child: RadioListTile(
                groupValue: radioItem,
                title: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.card_membership,
                        size: SizeConfig.screenHeight / 25,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.screenHeight / 30),
                      child: Container(
                        child: Text(
                          'Cash',
                          style: TextStyle(
                              fontSize: SizeConfig.screenHeight / 25,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                value: 'Item 1',
                onChanged: (val) {
                  setState(() {
                    radioItem = val;
                  });
                },
              ),
            ),
            Divider(
              height: SizeConfig.screenHeight / 20,
              indent: 15.0,
              endIndent: 15.0,
              color: Colors.black87,
            ),
            RadioListTile(
              groupValue: radioItem,
              title: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.credit_card,
                      size: SizeConfig.screenHeight / 25,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.screenHeight / 150,
                        left: SizeConfig.screenHeight / 30,
                        right: SizeConfig.screenHeight / 15),
                    child: Container(
                      //flex: 3,
                      child: Text(
                        'Credit/Debit Card',
                        style: TextStyle(
                            fontSize: SizeConfig.screenHeight / 25,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              value: 'Item 2',
              onChanged: (val) {
                setState(() {
                  radioItem = val;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: RaisedButton(
                onPressed: () {},
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                textColor: Colors.white,
                color: Colors.lightBlue[900],
                child: Text('Add New Payment Method',
                    style: TextStyle(
                      fontSize: SizeConfig.screenHeight / 30,
                      color: Colors.yellow[700],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
