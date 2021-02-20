import 'package:flutter/material.dart';
import 'package:location_menu_new/api/apiservices.dart';
import 'package:location_menu_new/models/almenuqrResturantModels.dart';
import 'package:location_menu_new/models/restaurant_model.dart';
import 'package:location_menu_new/models/resturantgooglemodel.dart';
import 'package:location_menu_new/models/review_model.dart';
import 'package:location_menu_new/models/reviewsRatingGoogleModel.dart';
import 'package:location_menu_new/screens/router_generator.dart';
import 'package:location_menu_new/search/restaurant_services.dart';

import '../consttants.dart';
import 'core/injector.dart';

// import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
// import 'package:resturantfinder/injector.dart';
// import 'package:resturantfinder/core/models/restaurant_model.dart';
// import 'package:resturantfinder/core/models/review_model.dart';
// import 'package:resturantfinder/core/services/restaurant/restaurant_services.dart';
// import 'package:resturantfinder/core/services/review/review_services.dart';
// import 'package:resturantfinder/core/viewmodels/location_provider.dart';
// import 'package:resturantfinder/injector.dart';
// import 'package:resturantfinder/ui/router/router_generator.dart';

class RestaurantProvider extends ChangeNotifier {
  //* ----------------------------
  //* This is side for property data
  //* ----------------------------

  //* Restaurant list variable
  List<RestaurantModel> _restaurantList;
  List<RestaurantModel> get restaurantList => _restaurantList;

  // //* Restaurant list by specific collection
  List<RestaurantModel> _restaurantByCollectionList;
  List<RestaurantModel> get restaurantByCollectionList =>
      _restaurantByCollectionList;

  // //* Restaurant list by specific keyword
  List<RestaurantModel> _restaurantByKeywordList;
  // List<RestaurantModel>  restaurantByKeywordList=[];
  List<RestaurantModel> get restaurantByKeywordList => _restaurantByKeywordList;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  ResturantGoogleModel _restaurangoogletList;
  ResturantGoogleModel get restaurantgoogleList => _restaurangoogletList;

  ResturantGoogleModel _restaurantgoogleByKeywordList;
  ResturantGoogleModel get restaurantgoogleByKeywordList =>
      _restaurantgoogleByKeywordList;

  List<AlmenuqrResturantModels> _almenuqrResturantModels;
  List<AlmenuqrResturantModels> get almenuqrResturantModels =>
      _almenuqrResturantModels;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // //* Review list by restaurant
  List<ReviewModel> _reviewList;
  List<ReviewModel> get reviewList => _reviewList;

  List<Review> _ratingResult;
  List<Review> get myreviewList => _ratingResult;

  //* To handle event search
  bool _onSearch = false;
  bool get onSearch => _onSearch;

  //* Dependency Injection
  RestaurantServices restaurantServices = locator<RestaurantServices>();
  // ReviewServices reviewServices = locator<ReviewServices>();

  //* ----------------------------
  //* Function field
  //* ----------------------------

  /// Function to get all restaurant by coordinate
  void getAll(BuildContext context) async {
    var res = await getResturant(
        "${publicurl}location=$latitude,$longitude&radius=500&types=restaurant&key=$apikey");
    _restaurangoogletList = resturantGoogleModelFromJson(res);
    // print(resturantGoogleModel.results[1].name);

    // final locationProv = Provider.of<LocationProvider>(context, listen: false);
    // _restaurantList = await restaurantServices.getAll(
    //     '14.5457479', //  locationProv.latitude.toString(),
    //     '44.4087478', //  locationProv.longitude.toString(),
    //     context);
    notifyListeners();
  }

  /// Function to search location
  void getAllByKeyword(String keyword, BuildContext context) async {
    //* Set search state to active
    setOnSearch(true);

    //* Clear previous history
    await clearResturantSearch();

    //* Then fetch new keyword
    // final locationProv = Provider.of<LocationProvider>(context, listen: false);

    var res = await getOurData();
    _almenuqrResturantModels = almenuqrResturantModelsFromMap(res);
    for (var h in _almenuqrResturantModels) {
      print('rest ${h.name}');
    }
    //var res = await getResturantKeyword(keyword);
    //_restaurantgoogleByKeywordList = resturantGoogleModelFromJson(res);
    // print(resturantGoogleModel.results[1].name);
    // for (var h in _restaurantgoogleByKeywordList.results) {
    //   print('rest ${h.name}');
    // }
    // _restaurantByKeywordList = await restaurantServices.getAllByKeyword(
    //     keyword,
    //     '14.5457479', //  locationProv.latitude.toString(),
    //     '44.4087478', //  locationProv.longitude.toString(),
    //     context);

    //* Set search state to deactive
    setOnSearch(false);
    notifyListeners();
  }

  /// Function to get restaurant by collection
  void getAllByCollection(String collectionID, BuildContext context) async {
    // _restaurantByCollectionList =
    //     await restaurantServices.getAllByCollection(collectionID, context);
    notifyListeners();
  }

  /// Function to get review by restaurant id
  void getReviewByResID(String restaurantID, BuildContext context) async {
    // _reviewList = await reviewServices.getAll(restaurantID, context);
    notifyListeners();
  }

  /// Function to handle onsearch state
  void setOnSearch(bool status) {
    _onSearch = status;
    notifyListeners();
  }

  /// Function to clear review
  void clearReview() {
    // _reviewList = null;
    notifyListeners();
  }

  /// Function to clear restaurant list by collection
  void clearRestaurantByCollection() {
    //  _restaurantByCollectionList = null;
    notifyListeners();
  }

  /// Function to clear restaurant list by collection
  clearResturantSearch() {
    // _restaurantByKeywordList = null;
    _restaurantgoogleByKeywordList = null;
    notifyListeners();
  }

  /// Function to navigate to search restaurant
  void goToSearchRestaurant(BuildContext context) async {
    await clearResturantSearch();
    Navigator.pushNamed(context, RouterGenerator.routeRestaurantSearch);
  }
}
