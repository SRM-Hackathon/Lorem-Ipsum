import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
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
  List<String> litems = ['user1', 'user2', 'user3', 'user4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followers'),
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
                color: Colors.blue,
                letterSpacing: 2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 15),
            child: Text(
              'People you can follow',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext ctxt, int Index) {
                    return Card(
                      elevation: 5,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text('User $Index'),
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
                          ButtonTheme.bar(
                            // make buttons use the appropriate styles for cards
                            child: ButtonBar(
                              children: <Widget>[
                                FlatButton(
                                  child: const Text('Follow'),
                                  onPressed: () {
                                    /* ... */
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )),
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