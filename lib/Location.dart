import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
import 'package:globetrottar/AppCall.dart';
String userPlace;
class LocationWidget extends StatefulWidget {

  LocationWidget({this.UserPlace});
  final String UserPlace;
  @override
  createState() {
    userPlace=this.UserPlace;
   return _LocationWidgetState();

  }
}
class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Place'),
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            Card(
            elevation: 5,
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(userPlace,style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700,letterSpacing: 2),),),
                  Container(
                    height: 50.0,
                  ),
                  Container(
                    child: Image.asset(''),
                  ),
                Container(
                  height: 50.0,
                ),
                Container(
                  child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                      style:new TextStyle(
                        fontSize: 12.0,
                      )),
                ),
                Container(
                  height: 50.0,
                ),
                Row(
                  
                  children: <Widget>[

                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Hero(
                            tag: "User1",
                            child: Icon(
                              Icons.account_circle,
                              size: 75.0,
                            ),
                          ),
                          FlatButton(
                            child: new Text('Jahnavi_Srividya'),
                            onPressed: (){
                             Navigator.push(context, MaterialPageRoute(
                               builder:(context) => UserRoute(urlString: 'jahnavi_srividya',number: 1)

                             ));
                            },
                          )
                        ],


                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Hero(
                            tag: "User2",
                            child: Icon(
                              Icons.account_circle,
                              size: 75.0,
                            ),
                          ),
                          FlatButton(
                            child: new Text('Harshana S'),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder:(context) => UserRoute(urlString: 'hana_phalange',number: 2)

                              ));
                            },
                          )
                        ],


                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Hero(
                            tag: "User3",
                            child: Icon(
                              Icons.account_circle,
                              size: 75.0,
                            ),
                          ),
                          FlatButton(
                            child: new Text('Jay Vishaal'),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder:(context) => UserRoute(urlString: 'jayvishaalj',number: 3)

                              ));
                            },
                          )
                        ],


                      ),
                    )

                  ],

                )





              ],


              )
            ),
            Container(
              child:RaisedButton(
                child: new Text('Create'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder:(context) => MyApp()));
                },
              )
            )

          ],
        ),
      ),

    );
  }

  }
class UserRoute extends StatelessWidget
{
  UserRoute({this.urlString,this.number});
  final String urlString;
  final int number;

  @override
  Widget build(BuildContext context) {
    String urlInsta="https://instagram.com/$urlString";
    // TODO: implement build
    return new WebviewScaffold(
      url: urlInsta,
      appBar: new AppBar(
          title: Text('User Profile')
      ),
    );
  }
}