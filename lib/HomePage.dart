import 'package:flutter/material.dart';
import 'package:geolocation/geolocation.dart';
import 'consttants.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  _getCurrentLocation() async {
    Geolocation.enableLocationServices().then((result) {
      // Request location
      // print(result);
    }).catchError((e) {
      // Location Services Enablind Cancelled
      // print(e);
    });

    Geolocation.currentLocation(accuracy: LocationAccuracy.best)
        .listen((result) {
      if (result.isSuccessful) {
        setState(() {
          latitude = result.location.latitude.toString();
          longitude = result.location.longitude.toString();
          print('lat is :${latitude}');
          print('long is :${longitude}');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Lattitude is : ${latitude} And Longitude Is: ${longitude}"),
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                _getCurrentLocation();
              },
            ),
          ],
        ),
      ),
    );
  }
}
