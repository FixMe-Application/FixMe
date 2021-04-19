import 'package:fix_me_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:fix_me_app/widgets/header.dart';

class TasksPage extends StatefulWidget {
  TasksPage({Key key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightBlue[900],
            title: Text(
              "Tasks",
              style: TextStyle(
                  fontSize: SizeConfig.screenWidth / 15,
                  color: Colors.yellow[700]),
              textAlign: TextAlign.center,
            )),
        body: Container(
          color: Colors.grey[800],
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 50),
                  child: TabBar(
                      labelColor: Colors.white,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.screenHeight / 40,
                          color: Colors.white),
                      tabs: [
                        Tab(text: "All"),
                        Tab(text: "Completed"),
                        Tab(text: "Cancelled")
                      ]),
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(children: [
                      Container(
                        child: Text(
                          "All Body",
                          style: TextStyle(
                              fontSize: SizeConfig.screenHeight / 40,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Completed Body",
                          style: TextStyle(
                              fontSize: SizeConfig.screenHeight / 40,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Cancelled Body",
                          style: TextStyle(
                              fontSize: SizeConfig.screenHeight / 40,
                              color: Colors.white),
                        ),
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
