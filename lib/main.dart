import 'package:flutter/material.dart';
import 'package:location_menu_new/search/core/injector.dart';
import 'package:location_menu_new/search/restaurant_provider.dart';
import 'package:location_menu_new/sheet/home_page.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RestaurantProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
