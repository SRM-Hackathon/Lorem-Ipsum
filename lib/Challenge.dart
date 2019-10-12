import 'Location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
String userID;
class ChallengeWidget extends StatefulWidget {
  ChallengeWidget(
      {this.userId}
      );
  final String userId;
  @override
  _ChallengeWidgetState createState(){
    userID=this.userId;
    return _ChallengeWidgetState();
  }
}

class _ChallengeWidgetState extends State<ChallengeWidget> {
  _ChallengeWidgetState() {
    getData();
  }

  List data;

  Future<String> getData() async {
    final String url =
        "https://globetrottar.herokuapp.com/api/getAdventurePlaces/10001";
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
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 35.0, top: 20.0),
              child: Text(
                'Recommended Places',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  letterSpacing: 2,
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: data == null
                  ? Text("Fetching destinations for you...")
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext ctxt, int Index) {
                        return FlatButton(
                            onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationWidget(userID:userID,UserPlace: data[Index])));
                            },
                            child: Card(
                                elevation: 5,
                                child: Stack(
                                  children: <Widget>[
                                    Opacity(
                                        opacity: 0.80,
                                        child:
                                            Image.asset('images/$Index.jpg')),
                                    Center(
                                        child: Text(
                                      data[Index],
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 2),
                                    ))
                                  ],
                                )));
                      },
                    ),
            )),
          ],
        ));
  }
}
