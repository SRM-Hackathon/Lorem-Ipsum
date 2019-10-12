import 'dart:html';
import 'Location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ChallengeWidget extends StatefulWidget {
  @override
  _ChallengeWidgetState createState() => _ChallengeWidgetState();
}

class _ChallengeWidgetState extends State<ChallengeWidget> {
  _ChallengeWidgetState() {
    getData();
  }

  List data;

  Future<String> getData() async {
    final String url = "https://globetrottar.herokuapp.com/api/getAdventurePlaces/10001";
    var res =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    debugPrint(res.body);
    setState(() {
      var resBody = json.decode(res.body);
      data = resBody["places"];
    });
    debugPrint("Success");
    debugPrint(data[0]);
    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GlobetrottAR'),
        leading: CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage(
            'images/user_dp.jpg',
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 35.0, top: 20.0),
            child: Text(
              'CHALLENGES',
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
              'We have got few challenes for you , try them !!',
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
              itemCount: data.length==null?0:data.length,
              itemBuilder: (BuildContext ctxt, int Index) {
                return Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(data[Index],style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700,letterSpacing: 2),),
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage(
                            'images/user_dp.jpg',
                          ),
                        ),
                        subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                            style:new TextStyle(
                          fontSize: 12.0,
                        )),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LocationWidget(UserPlace:data[Index])));
                        },
                      ),
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
