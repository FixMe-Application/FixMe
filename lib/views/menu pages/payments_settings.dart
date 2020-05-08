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
    return Scaffold(
      appBar: header(titleText: 'Payment'),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: RadioListTile(
                groupValue: radioItem,
                title: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.card_membership,
                        size: 25.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Text(
                          'Cash'
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
              height: 10.0,
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
                      size: 25.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      //flex: 3,
                      child: Text(
                        'Credit/Debit Card'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: GestureDetector(
                      onTap: (){},
                      child: Icon(
                        Icons.arrow_forward,
                      ),
                    ),
                  )
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
                color: Colors.blueAccent,
                child: Text(
                  'Add New Payment Method',
                  style: TextStyle(
                    fontSize: 20.0
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}