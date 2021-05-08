import 'package:fix_me_app/sizeConfig.dart';
import 'package:fix_me_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class AddCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddCardState();
  }
}

class AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Text(
          'Add a New Card',
          style: TextStyle(
              fontSize: SizeConfig.screenWidth / 15, color: Colors.yellow[700]),
          textAlign: TextAlign.center,
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        color: Colors.grey[800],
        child: SafeArea(
          child: Column(
            children: <Widget>[
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                height: SizeConfig.screenHeight / 3,
                width: SizeConfig.screenWidth,
                cardBgColor: Colors.lightBlue[900],
                textStyle: TextStyle(
                    fontSize: SizeConfig.screenHeight / 35,
                    color: Colors.white),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: CreditCardForm(
                    cardHolderDecoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white)),
                    themeColor: Colors.white,
                    onCreditCardModelChange: onCreditCardModelChange,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Add'),
        icon: Icon(Icons.done),
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
