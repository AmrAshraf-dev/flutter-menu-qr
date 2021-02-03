import 'package:flutter/material.dart';
import 'package:location_menu_new/models/resturantgooglemodel.dart';
import 'package:location_menu_new/models/reviewsRatingGoogleModel.dart';
import 'package:location_menu_new/restaurant/restaurant_detail_screen.dart';
import 'package:location_menu_new/screens/router_generator.dart';
import 'package:location_menu_new/search/restaurant_provider.dart';
import 'package:provider/provider.dart';
import 'constant.dart';
import 'core/custom_rating.dart';
import 'package:http/http.dart' as http;

// import 'package:book_app/search/router_generator.dart';
// import 'package:book_app/search/custom_rating.dart';

class RestaurantMiniItem extends StatefulWidget {
  Result restaurant;
  RestaurantMiniItem({@required this.restaurant});

  @override
  _RestaurantMiniItemState createState() => _RestaurantMiniItemState();
}

class _RestaurantMiniItemState extends State<RestaurantMiniItem> {
  ReviewsRatingGoogleModel resultrating;
  bool isLongPress = false;
  double marginVertical = 5;
  double marginHorizontal = 0;
  void onLongPress() {
    setState(() {
      isLongPress = true;
      marginVertical = 25;
      marginHorizontal = 25;
    });
  }

  void onLongPressEnd() {
    setState(() {
      marginVertical = 5;
      marginHorizontal = 0;
    });
  }

  _getrating(String place_id) async {
    final res = await http.get(
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=${place_id}&key=AIzaSyBjCCuQL1P3qR6qti1Hh-eb5WwigF9F_84");
    var tdata;
    await http
        .get(
      "https://maps.googleapis.com/maps/api/place/details/json?place_id=${place_id}&key=AIzaSyBjCCuQL1P3qR6qti1Hh-eb5WwigF9F_84",
    )
        .then((response) {
      tdata = response.body;
    }).timeout(
      Duration(seconds: 10),
      onTimeout: () {
        return null;
      },
    );

    resultrating = reviewsRatingGoogleModelFromJson(tdata);

    // for (var h in resultrating.result.reviews) {
    //   print(h.text);
    // }

    return tdata;
  }

  void onClick() async {
    await Provider.of<RestaurantProvider>(context, listen: false).clearReview();
    await _getrating(widget.restaurant.placeId);
    //print('ffffffffgggggggggggghhhhhhhhhhhhhjjjjjjjjjj:${}');
    // Navigator.pushNamed(context, RouterGenerator.routeDetailRestaurant,
    //     arguments: widget.restaurant);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RestaurantDetailScreen(
                restaurant: widget.restaurant,
                resultrating: resultrating,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      onLongPress: () => onLongPress(),
      onLongPressEnd: (val) => onLongPressEnd(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: deviceWith(context),
        margin: EdgeInsets.symmetric(
            vertical: marginVertical, horizontal: marginHorizontal),
        // margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _imageRestaurant(),
                SizedBox(width: 10),
                _content()
              ],
            ),
            Divider(color: Colors.black12),
          ],
        ),
      ),
    );
  }

  Widget _imageRestaurant() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
            image: widget.restaurant.photos == null
                ? NetworkImage(widget.restaurant.icon)
                : NetworkImage(
                    'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${widget.restaurant.photos[0].photoReference}&key=AIzaSyBjCCuQL1P3qR6qti1Hh-eb5WwigF9F_84'),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget _content() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.restaurant.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 5),
          CustomRating(
            rating: widget.restaurant.rating,
            useReview: false,
          ),
          SizedBox(height: 5),
          Text(
            widget.restaurant.vicinity,
            style: TextStyle(
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
