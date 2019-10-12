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
  List<Map<String, String>> iOSApps = [
    {
      "app_name": "Calendar",
      "package_name": "calshow://"
    },
    {
      "app_name": "Facebook",
      "package_name": "fb://"
    },
    {
      "app_name": "Whatsapp",
      "package_name": "whatsapp://"
    }
  ];


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
      print(await AppAvailability.checkAvailability("com.jayvishaal.globetrottar"));
      print(await AppAvailability.isAppEnabled("com.android.chrome"));
      // Returns: true

    }

    setState(() {
      installedApps = _installedApps;
    });

  }

  @override
  Widget build(BuildContext context) {
    if (installedApps == null)
      getApps();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin flutter_appavailability app'),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Globetrottar'),
              trailing: IconButton(
                  icon: const Icon(Icons.open_in_new),
                  onPressed: () {
                    Scaffold.of(context).hideCurrentSnackBar();
                    AppAvailability.launchApp("com.jayvishaal.globetrottar").then((_) {
                      print("App Globetrottar launched!");
                    }).catchError((err) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("App Globetrottar not found!")
                      ));
                      print(err);
                    });
                  }
              ),
            );
          },
        ),
      ),
    );
  }
}