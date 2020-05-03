import 'package:fix_me_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class AddCard extends StatefulWidget {
  @override
  State < StatefulWidget > createState() {
    return AddCardState();
  }
}

class AddCardState extends State < AddCard > {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(titleText: 'Add a New Card'),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: < Widget > [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              height: 150,
              width: MediaQuery.of(context).size.width,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: CreditCardForm(
                  onCreditCardModelChange: onCreditCardModelChange,
                ),
              ),
            ),
            // FlatButton(
            //   color: Colors.blue,
            //   onPressed: () {},
            //   shape: StadiumBorder(),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            //       child: Text(
            //         "Add",
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 15.0
            //         ),

            //       ),
            //   ),
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.done),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}