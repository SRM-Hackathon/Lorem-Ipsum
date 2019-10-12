import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'Challenge.dart';
final databaseReference = FirebaseDatabase.instance.reference();
String userID;

class FollowWidget extends StatefulWidget {
  FollowWidget({this.userId});
  final String userId;
  @override
  _FollowWidgetState createState(){
    userID=userId;
    return _FollowWidgetState();
  }
}

class _FollowWidgetState extends State<FollowWidget> {
  List<String> litems = ['Harshana', 'Jahnavi', 'Jay', 'Vijay'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followers',),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 35.0, top: 20.0),
            child: Text(
              'Welcome GlobetrottAR',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
                letterSpacing: 3,
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: litems.length,
                  itemBuilder: (BuildContext ctxt, int Index) {
                    return Card(
                      elevation: 5,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(litems[Index]),
                            leading: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage(
                                'images/user_dp.jpg',
                              ),
                            ),
                            onTap: () => {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FollowRoute()))
                          },
                          ),
                          Container(
                            height: 30.0,
                          )
                        ],
                      ),
                    );
                  },
                ),
              )),
          new RaisedButton(
            child: new Text('Next'),
            onPressed: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ChallengeWidget(userId:userID)));
            },
          )
        ],
      ),
    );
  }
}


class FollowRoute extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WebviewScaffold(
      url: "https://instagram.com/hana_phalange",
      appBar: new AppBar(
        title: Text('User Profile')
      ),
    );
  }
}