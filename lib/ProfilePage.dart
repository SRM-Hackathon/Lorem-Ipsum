import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({this.userId});

  final String userId;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileState();
  }
}

class _ProfileState extends State<ProfilePage> {

  List<Widget> widgets = [FirstPageWidget(), SecondPageWidget(),ThirdPageWidget(),FourthPageWidget(),FifthPageWidth(),SixthPageWidget()];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Profile")),
      body: new SingleChildScrollView(
          child: Container(
        color: Colors.indigo,
        height: 2000,
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
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
                      ),
                      child: i,
                    );
                  },
                );
              }).toList(),
            )
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
  TextEditingController userNameController = new TextEditingController();
  TextEditingController userBioController = new TextEditingController();
  var userName = '';
  var userBio = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        child: Column(
          children: <Widget>[
            new TextField(
              controller: userNameController,
              onChanged: (value) {
                userName = value;
              },
              decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Container(
              height: 50.0,
            ),
            new TextField(
              controller: userBioController,
              onChanged: (value) {
                userBio = value;
              },
              decoration: InputDecoration(
                  labelText: 'Hey,let others know about you!',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Container(
              height: 30.0,
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('UPDATE DETAILS'),
                    onPressed: () {
                      /* ... */
                    },
                  ),
                ],
              ),
            )
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
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "What type of trips most interest you?",
              style: new TextStyle(
                  fontSize: 25.0, wordSpacing: 1, fontWeight: FontWeight.w600),
            ),
          ),
          RadioButtonGroup(labels: <String>[
            "ADVENTURE",
            "RECEUTION",
            "ENVIRONMENT",
            "PILGRIMAGE / RELIGIOUS",
            "CULTURAL HERITAGE",
            "CALCULATIONAL"
          ], onSelected: (String selected) => print(selected)),
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
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "How long do you generally prefer your trips to last ",
              style: new TextStyle(
                  fontSize: 25.0, wordSpacing: 1, fontWeight: FontWeight.w600),
            ),
          ),
          RadioButtonGroup(labels: <String>[
            "2 hrs",
            "12 hrs",
            "One day",
            "Weekend",
            "10 days"
          ], onSelected: (String selected) => print(selected)),
        ],
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
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
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
          ], onSelected: (String selected) => print(selected)),
        ],
      ),
    );
  }
}
class FifthPageWidth extends StatefulWidget {
  @override
  _FifthPageWidthState createState() => _FifthPageWidthState();
}

class _FifthPageWidthState extends State<FifthPageWidth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Do you prefer using your own Vehicle ? ",
              style: new TextStyle(
                  fontSize: 25.0, wordSpacing: 1, fontWeight: FontWeight.w600),
            ),
          ),
          RadioButtonGroup(labels: <String>[
            "Yes",
            "N , I mostly rent",
            "Prefer Public Transport"
          ], onSelected: (String selected) => print(selected)),
        ],
      ),
    );
  }
}

class SixthPageWidget extends StatefulWidget {
  @override
  _SixthPageWidgetState createState() => _SixthPageWidgetState();
}

class _SixthPageWidgetState extends State<SixthPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Do you Travel ALONE ? ",
              style: new TextStyle(
                  fontSize: 25.0, wordSpacing: 1, fontWeight: FontWeight.w600),
            ),
          ),
          RadioButtonGroup(labels: <String>[
            "Yes",
            "No"
          ], onSelected: (String selected) => print(selected)),
        ],
      ),
    );
  }
}




//  List<Widget> fillUserDetails() {
//    return [
////      SizedBox(
////        height: 30.0,
////      )
////      ,
////      new Text("Profile Picture"),
////      SizedBox(
////        height: 80.0,
////      ),
////      new Text("Username"),
////      new TextField(
////        controller: userNameController,
////        onChanged: (value) {
////          userName = value;
////        },
////        decoration: InputDecoration(
////            labelText: 'Username',
////            border:
////            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
////      ),
////      new Text("About you"),
////      new TextField(
////        controller: userBioController,
////        onChanged: (value) {
////          userBio = value;
////        },
////
////        decoration: InputDecoration(
////            labelText: 'Hey,let others know about you!',
////            border:
////            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
////      ),
////      SizedBox(
////        height: 30.0,
////      ),
////      new Text("Answer these to let us understand you more!"),
//
////      new ListView(scrollDirection: Axis.horizontal, children: <Widget>[
////        Container(
////          margin: EdgeInsets.symmetric(vertical: 20.0),
////          height: 200.0,
////          width: 160.0,
////          child: new Column(
////            children: <Widget>[
////              new Container(
////                color: Colors.indigo,
////                child: new Text(
////                  "What type of trips most interest you?",
////                  style: new TextStyle(
////                      color: Colors.white,
////                      fontSize: 30.0,
////                      fontWeight: FontWeight.w600),
////                ),
////              ),
////              new Container(
////                color: Colors.white,
////                child: new ListTile(
////                  title: new Text('Lorem'),
//////                  title: DropdownButton(
//////                    items: userInterests.map((String userInterest) {
//////                      return DropdownMenuItem<String>(
//////                        value: userInterest,
//////                        child: Text(userInterest),
//////                      );
//////                    }).toList(),
//////                    value: selectedUserInterest,
//////                    onChanged: (value) {
//////                      setState(() {
//////                        selectedUserInterest = value;
//////                      });
//////                    },
//////                  ),
////                ),
////              )
////            ],
////          ),
////        ),
////        Container(
////          width: 160.0,
////          child: new Column(
////            children: <Widget>[
////              new Container(
////                color: Colors.orange,
////                child: new Text(
////                  "Are you an avid traveller?",
////                  style: new TextStyle(
////                      color: Colors.white,
////                      fontSize: 30.0,
////                      fontWeight: FontWeight.w600),
////                ),
////              ),
////              new Container(
////                color: Colors.white,
////                child: new ListTile(
////                    title: new Text('Lorem')
//////                  title: DropdownButton(
//////                    items: userTypes.map((String userType) {
//////                      return DropdownMenuItem<String>(
//////                        value: userType,
//////                        child: Text(userType),
//////                      );
//////                    }).toList(),
//////                    value: selectedUserType,
//////                    onChanged: (value) {
//////                      setState(() {
//////                        selectedUserType = value;
//////                      });
//////                    },
//////                  ),
////                ),
////              )
////            ],
////          ),
////        ),
////        Container(
////          width: 160.0,
////          child: new Column(
////            children: <Widget>[
////              new Container(
////                color: Colors.orange,
////                child: new Text(
////                  "How long do you want your trips to last?",
////                  style: new TextStyle(
////                      color: Colors.white,
////                      fontSize: 30.0,
////                      fontWeight: FontWeight.w600),
////                ),
////              ),
////              new Container(
////                color: Colors.white,
////                child: new ListTile(
////                    title: new Text('Lorem')
//////  title: DropdownButton(
//////  items: userDurations.map((String userDuration) {
//////  return DropdownMenuItem<String>(
//////  value: userDuration,
//////  child: Text(userDuration),
//////  );
//////  }).toList(),
//////  value: selectedUserDuration,
//////  onChanged: (value) {
//////  setState(() {
//////  selectedUserDuration = value;
//////  });
//////  },
//////  ),
////                ),
////              )
////            ],
////          ),
////        )
////        ,
////      ]
////      )
//    ];
//  }
