import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:firebase_database/firebase_database.dart';
import 'following.dart';
final databaseReference = FirebaseDatabase.instance.reference();
TextEditingController userNameController = new TextEditingController();
TextEditingController instagramUserNameController = new TextEditingController();
TextEditingController userBioController = new TextEditingController();
var userName = '';
var userBio = '';
var instagramUserName='';
var selectedInterest;
var selectedTrip;
String userID;
class ProfilePage extends StatefulWidget {

  ProfilePage({this.userId});
  final String userId;




  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    userID=userId;
    return _ProfileState();
  }
}

class _ProfileState extends State<ProfilePage> {


  List<Widget> widgets = [FirstPageWidget(), SecondPageWidget(),ThirdPageWidget(),FourthPageWidget(),SixthPageWidget()];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Profile"),
      backgroundColor: Colors.deepOrangeAccent,),
      body: new SingleChildScrollView(
          child: Container(
            color: Colors.white,
            height: 0.89*screenSize.height,
          child: Column(
            children: <Widget>[
            Container(
              height: 70,
            ),
            CarouselSlider(
              height: 500.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              items: widgets.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0)
                        ),
                        border : Border.all(
                          color: Colors.deepOrangeAccent,
                          width: 3.0
                        )
                      ),
                      child: i,
                    );
                  },
                );
              }).toList(),
            ),

          ],
        ),
      )),
    );
  }
}

class FirstPageWidget extends StatefulWidget {
  @override
  _FirstPageWidgetState createState() => _FirstPageWidgetState();
}

class _FirstPageWidgetState extends State<FirstPageWidget> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: userNameController,
                onChanged: (value) {
                  userName = value;
                },
                decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Container(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: userBioController,
                onChanged: (value) {
                  userBio = value;
                },
                decoration: InputDecoration(
                    labelText: 'About You ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Container(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: instagramUserNameController,
                onChanged: (value) {
                  instagramUserName = value;
                },
                decoration: InputDecoration(
                    labelText: 'Instagram Username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Container(
              height: 30.0,
            ),

          ],
        ),
      ),
    );
  }
}

class SecondPageWidget extends StatefulWidget {
  @override
  _SecondPageWidgetState createState() => _SecondPageWidgetState();
}

class _SecondPageWidgetState extends State<SecondPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "What type of trips most interest you?",
              style: new TextStyle(
                  fontSize: 25.0, wordSpacing: 1, fontWeight: FontWeight.w600),
            ),
          ),
          RadioButtonGroup(labels: <String>[
            "Adventure",
            "Recreation",
            "Environment",
            "Pilgrimage",
            "Cultural Heritage",
            "Educational"
          ], onSelected: (String selected) => {
            selectedInterest=selected,
          }),
        ],
      ),
    );
  }
}
class ThirdPageWidget extends StatefulWidget {
  @override
  _ThirdPageWidgetState createState() => _ThirdPageWidgetState();
}

class _ThirdPageWidgetState extends State<ThirdPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "How long do you want to  travel ? ",
                style: new TextStyle(
                    fontSize: 25.0, wordSpacing: 1, fontWeight: FontWeight.w600),
              ),
            ),
            RadioButtonGroup(labels: <String>[
              "One Day",
              "Weekend",
              "Ten Days"
            ], onSelected: (String selected) => {
              selectedTrip=selected,
            }),
          ],
        ),
      ),
    );
  }
}

class FourthPageWidget extends StatefulWidget {
  @override
  _FourthPageWidgetState createState() => _FourthPageWidgetState();
}

class _FourthPageWidgetState extends State<FourthPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "Are you an avid traveller ? rate yourself !!! ",
                style: new TextStyle(
                    fontSize: 25.0, wordSpacing: 1, fontWeight: FontWeight.w600),
              ),
            ),
            RadioButtonGroup(labels: <String>[
              "1",
              "2",
              "3",
              "4",
              "5"
            ], onSelected: (String selected) => {
              //selectedRating=selected,
            }),
          ],
        ),
      ),
    );
  }
}
//class FifthPageWidth extends StatefulWidget {
//  @override
//  _FifthPageWidthState createState() => _FifthPageWidthState();
//}
//
//class _FifthPageWidthState extends State<FifthPageWidth> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Column(
//        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.all(30.0),
//            child: Text(
//              "Do you prefer using your own Vehicle ? ",
//              style: new TextStyle(
//                  fontSize: 25.0, wordSpacing: 1, fontWeight: FontWeight.w600),
//            ),
//          ),
//          RadioButtonGroup(labels: <String>[
//            "Yes",
//            "Nah! I mostly rent",
//            "Prefer Public Transport"
//          ], onSelected: (String selected) => {
//            //selectedTransport=selected,
//          }),
//        ],
//      ),
//    );
//  }
//}

class SixthPageWidget extends StatefulWidget {
  @override
  _SixthPageWidgetState createState() => _SixthPageWidgetState();
}

class _SixthPageWidgetState extends State<SixthPageWidget> {
  void createRecord(){
    databaseReference.child("Users").child(userID).set({
      'userName':userName,
      'userBio':userBio,
      'userInterest':selectedInterest,
      'userType':selectedTrip,
      'instagramUserName':instagramUserName,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                "How do you like to Travel?",
                style: new TextStyle(
                    fontSize: 25.0, wordSpacing: 1, fontWeight: FontWeight.w600),
              ),
            ),
            RadioButtonGroup(labels: <String>[
              "Alone",
              "Couple",
              "Group"
            ], onSelected: (String selected) => {
              //selectedPreference=selected,
            }),
            Container(
              height: 40,
            ),
            RaisedButton(
              child:new Text('Submit and Proceed'),
              color: Colors.deepOrangeAccent,
                elevation: 5.0,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0)
                )
              ),
              onPressed:(){
                createRecord();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FollowWidget()));
              },
            )
          ],
        ),
      ),
    );
  }
}


