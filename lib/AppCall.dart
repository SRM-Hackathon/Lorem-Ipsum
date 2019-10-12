import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_appavailability/flutter_appavailability.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> installedApps;

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> getApps() async {
    List<Map<String, String>> _installedApps;
    if (Platform.isAndroid) {
      _installedApps = await AppAvailability.getInstalledApps();
      print(_installedApps);
      print(await AppAvailability.checkAvailability("com.android.chrome"));
      // Returns: Map<String, String>{app_name: Chrome, package_name: com.android.chrome, versionCode: null, version_name: 55.0.2883.91}
      print(await AppAvailability.checkAvailability(
          "com.jayvishaal.globetrottar"));
      print(await AppAvailability.isAppEnabled("com.android.chrome"));
      // Returns: true
    }
    setState(() {
      installedApps = _installedApps;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (installedApps == null) getApps();
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 20,
          ),
          Center(
            child: Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(
                  '\t You WON \n\n 50 Points !!!',
                  style: TextStyle(
                      fontSize: 25, color: Colors.black, letterSpacing: 2),
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              elevation: 5,
              child: Stack(
                children: <Widget>[
                  Opacity(
                      opacity: 0.50, child: Image.asset('images/1.jpg')),
                  Center(
                      child: Text( "Book My show",
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2),
                  ))
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Host the Flag '),
                  leading: IconButton(
                      icon: const Icon(Icons.flag),
                      onPressed: () {
                        Scaffold.of(context).hideCurrentSnackBar();
                        AppAvailability.launchApp("com.jayvishaal.globetrottar")
                            .then((_) {
                          print("App Globetrottar launched!");
                        }).catchError((err) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("App Globetrottar not found!")));
                          print(err);
                        });
                      }),
                );
              },
            ),
          ),
        ],
      ),
    )
//          body: Column(
//            children: <Widget>[
//              Card(
//                  child: Text(
//                'You WON 50 Points !!!',
//                style: TextStyle(
//                  color: Colors.black,
//                  decoration: TextDecoration.underline,
//                  decorationColor: Colors.red,
//                  decorationStyle: TextDecorationStyle.wavy,
//                ),
//              )),
//              Container(),
//              ListView.builder(
//                itemCount: 1,
//                itemBuilder: (context, index) {
//                  return ListTile(
//                    title: Text('Host the Flag '),
//                    trailing: IconButton(
//                        icon: const Icon(Icons.open_in_new),
//                        onPressed: () {
//                          Scaffold.of(context).hideCurrentSnackBar();
//                          AppAvailability.launchApp("com.jayvishaal.VFM")
//                              .then((_) {
//                            print("App Globetrottar launched!");
//                          }).catchError((err) {
//                            Scaffold.of(context).showSnackBar(SnackBar(
//                                content: Text("App Globetrottar not found!")));
//                            print(err);
//                          });
//                        }),
//                  );
//                },
//              ),
//            ],
//          )),
        );
  }
}
