import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Models/chatMessageModel.dart';

class ChatBot extends StatefulWidget {
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {


  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, I am FixMe ChatBot", messageType: "receiver"),
    ChatMessage(messageContent: "How can I help you? Please choose one topic from below", messageType: "receiver"),
    ChatMessage(messageContent: "1. Warning Lights", messageType: "receiver"),
    ChatMessage(messageContent: "2. A Sputtering Engine", messageType: "receiver"),
    ChatMessage(messageContent: "3. Poor Fuel Economy", messageType: "receiver"),
    ChatMessage(messageContent: "4. Dead Battery", messageType: "receiver"),
    ChatMessage(messageContent: "5. Flat Tires", messageType: "receiver"),
    ChatMessage(messageContent: "6. Brakes Squeaking or Grinding", messageType: "receiver"),
    ChatMessage(messageContent: "7. Alternator Failure", messageType: "receiver"),
    ChatMessage(messageContent: "8. Broken Starter Motor", messageType: "receiver"),
    ChatMessage(messageContent: "9. Steering Wheel Shaking", messageType: "receiver"),
    ChatMessage(messageContent: "10. Failed Emissions Test", messageType: "receiver"),
    ChatMessage(messageContent: "11. Overheating", messageType: "receiver"),
    ChatMessage(messageContent: "12. Slipping Automatic Transmission", messageType: "receiver"),
    ChatMessage(messageContent: "1", messageType: "sender"),
    ChatMessage(messageContent: "A warning or check engine light is the most common issue for US car, truck and SUV owners. These lights illuminate when the vehicle’s ECU (engine control unit) detects an error code triggered by a sensor. Since there are more than 200 possible warning code, having a professional mechanic complete a warning light inspection is the best way to determine the source and make the right repairs.", messageType: "receiver"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.black,),
                  ),
                  SizedBox(width: 2,),
                  CircleAvatar(
                    child: Image.asset("assets/chatbot.png"),
                    maxRadius: 20,
                    backgroundColor: Colors.lightBlue,
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("FixMe ChatBot",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){},
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}
