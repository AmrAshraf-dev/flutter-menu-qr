import 'package:flutter/material.dart';
import 'package:location_menu_new/models/collection_model.dart';
import 'package:location_menu_new/models/restaurant_model.dart';
import 'package:location_menu_new/models/resturantgooglemodel.dart';
import 'package:location_menu_new/restaurant/restaurant_by_collection_screen.dart';
import 'package:location_menu_new/restaurant/restaurant_detail_screen.dart';
import 'package:location_menu_new/restaurant/restaurant_search_screen.dart';
import 'package:location_menu_new/sheet/home_page.dart';

class RouterGenerator {
  //* Routing list
  static const routeHome = "/home";
  static const routeDetailRestaurant = "/restaurant/detail";
  static const routeRestaurantByCollection = "/restaurant/collection";
  static const routeRestaurantSearch = "/restaurant/search";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case routeRestaurantSearch:
        return MaterialPageRoute(builder: (_) => RestaurantSearchScreen());
        break;
      case routeDetailRestaurant:
        if (args is Result) {
          return MaterialPageRoute(
              builder: (_) => RestaurantDetailScreen(
                    restaurant: args,
                  ));
        }
        break;
      case routeRestaurantByCollection:
        if (args is CollectionModel) {
          return MaterialPageRoute(
              builder: (_) => RestaurantByCollectionScreen(
                    collection: args,
                  ));
        }
        break;
    }
  }
}
