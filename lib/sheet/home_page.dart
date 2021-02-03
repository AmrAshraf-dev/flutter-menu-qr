// import 'package:book_app/sheet/tabs.dart';
import 'package:flutter/material.dart';
import 'package:geolocation/geolocation.dart';
import 'package:location_menu_new/api/apiservices.dart';
import 'package:location_menu_new/models/resturantgooglemodel.dart';
import 'package:location_menu_new/sheet/sliding_cards.dart';
// import 'package:location/location.dart';
import '../consttants.dart';
import 'exhibition_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  // Location location = new Location();
  // bool _serviceEnabled;
  // PermissionStatus _permissionGranted;

  // Future initlocation() async {
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   locationData = await location.getLocation();
  // }

  getrest() async {
    var res = await getResturant(
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=500&types=restaurant&key=AIzaSyBjCCuQL1P3qR6qti1Hh-eb5WwigF9F_84");
    resturantGoogleModel = resturantGoogleModelFromJson(res);
    // print(resturantGoogleModel.results[1].name);
    for (var h in resturantGoogleModel.results) {
      print(h.name);
    }
  }

  @override
  void initState() {
    super.initState();
    // getrest();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8),
                Header(),
                SizedBox(height: 0),
                // Tabs(),
                Center(
                  child: Container(
                    width: size.width - 90,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/black.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                SlidingCardsView(),
              ],
            ),
          ),
          ExhibitionBottomSheet(), //use this or ScrollableExhibitionSheet
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        'ALMENUQR',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
