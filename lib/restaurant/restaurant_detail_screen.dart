import 'package:flutter/material.dart';
import 'package:location_menu_new/models/resturantgooglemodel.dart';
import 'package:location_menu_new/models/reviewsRatingGoogleModel.dart';
import 'package:location_menu_new/search/core/currency_utils.dart';
import 'package:location_menu_new/search/core/custom_rating.dart';
import 'package:location_menu_new/search/core/my_review_item_2.dart';
import 'package:location_menu_new/search/restaurant_provider.dart';
import 'package:location_menu_new/search/review_item.dart';
import 'package:location_menu_new/widgets/web_view_home.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'items/highlight.dart';

class RestaurantDetailScreen extends StatelessWidget {
  ReviewsRatingGoogleModel resultrating;
  Result restaurant;
  RestaurantDetailScreen({@required this.restaurant, this.resultrating});
  //Resultrating resultrating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RestaurantDetailBody(
        restaurant: restaurant,
        resultrating: resultrating,
      ),
    );
  }
}

class RestaurantDetailBody extends StatefulWidget {
  ReviewsRatingGoogleModel resultrating;
  Result restaurant;
  //Resultrating resultrating;

  RestaurantDetailBody({@required this.restaurant, this.resultrating});

  @override
  _RestaurantDetailBodyState createState() => _RestaurantDetailBodyState();
}

class _RestaurantDetailBodyState extends State<RestaurantDetailBody> {
  //ReviewsRatingGoogleModel resultrating;
  Color iconBackColor = Colors.white;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.transparent;

  ScrollController scrollController;
  _scrollListener() {
    if (scrollController.offset >= 100) {
      setState(() {
        iconBackColor = Colors.black87;
        textColor = Colors.black87;
        backgroundColor = Colors.white;
      });
    } else {
      setState(() {
        iconBackColor = Colors.white;
        textColor = Colors.white;
        backgroundColor = Colors.transparent;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener(_scrollListener);
    // _getrating(widget.restaurant.placeId);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            controller: scrollController,
            child: _content()),
        _appBar(),
      ],
    );
  }

  Widget _appBar() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Container(
              height: 24,
              color: backgroundColor,
            ),
            Container(
              height: 50,
              color: backgroundColor,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: iconBackColor),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      widget.restaurant.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _content() {
    return Container(
      child: Column(
        children: <Widget>[
          _imageCover(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 5),
                CustomRating(
                  rating: widget.restaurant.rating == null
                      ? 0
                      : widget.restaurant.rating,
                  useReview: false,
                  review: widget.restaurant.reviews,
                  //userRatingsTotal: widget.restaurant.userRatingsTotal,
                ),
                SizedBox(height: 15),
                _title(),
                SizedBox(height: 5),
                _cuisines(),
                SizedBox(height: 5),
                //  _address(),
                SizedBox(height: 5),
                // _price(),
                Divider(color: Colors.black12),
                // Highlight(
                //   highlight: widget.restaurant.highlights,
                // ),
                Divider(color: Colors.black12),
                SizedBox(height: 10),
                //  _addressFull(),
                SizedBox(height: 15),
                //  _openTime(),
                SizedBox(height: 10),
                Divider(color: Colors.black12),
                SizedBox(height: 15),
                _reviews(),
                SizedBox(height: 20),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WebViewHome()),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Go to Restraunt Menu',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _ratingResult() {
    return widget.resultrating.result.reviews == null
        ? Image.network(widget.restaurant.icon)
        :
        // Container(
        //     child: Column(
        //     children: [
        //       Text('sssss'),
        //     ],
        //   ));

        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.resultrating.result.reviews.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var review2 = widget.resultrating.result.reviews[index];
              return MyReviewItem(
                myreview: review2,
              );
            }
            // Row(
            //   children: [
            //     Image.network(resultrating.result.reviews[0].profilePhotoUrl),
            //     Text(resultrating.result.reviews[1].text),

            //   ],
            // ),
            );
  }

  Widget _imageCover() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
            image: widget.restaurant.photos == null
                ? NetworkImage(widget.restaurant.icon)
                : NetworkImage(
                    'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${widget.restaurant.photos[0].photoReference}&key=AIzaSyBjCCuQL1P3qR6qti1Hh-eb5WwigF9F_84'),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget _title() {
    return Text(
      widget.restaurant.name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget _cuisines() {
    return Text(
      widget.restaurant.vicinity,
      style: TextStyle(color: Colors.black87, fontSize: 12),
    );
  }

  // Widget _address() {
  //   return Text(
  //     widget.restaurant.address,
  //     style: TextStyle(color: Colors.black87, fontSize: 12),
  //   );
  // }

  // Widget _price() {
  //   return Text(
  //     "${widget.restaurant.currency} ${formatter.format(widget.restaurant.priceForTwo)} / 2 person",
  //     style: TextStyle(
  //         color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold),
  //   );
  // }

  // Widget _addressFull() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       Text(
  //         "Alamat Restoran",
  //         style: TextStyle(
  //             color: Colors.black87, fontSize: 15, fontWeight: FontWeight.bold),
  //       ),
  //       SizedBox(height: 5),
  //       Text(
  //         widget.restaurant.addressFull,
  //         style: TextStyle(color: Colors.black87, fontSize: 12),
  //       ),
  //     ],
  //   );
  // }

  // Widget _openTime() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       Text(
  //         "Jam Buka",
  //         style: TextStyle(
  //             color: Colors.black87, fontSize: 15, fontWeight: FontWeight.bold),
  //       ),
  //       SizedBox(height: 5),
  //       Text(
  //         widget.restaurant.openTime,
  //         style: TextStyle(color: Colors.black87, fontSize: 12),
  //       ),
  //     ],
  //   );
  // }

  Widget _reviews() {
    return Builder(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Review Terbaru",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            //_reviewList()

            _ratingResult(),
          ],
        );
      },
    );
  }

  // Widget _reviewList() {
  //   return Builder(
  //     builder: (context) {
  //       return Consumer<RestaurantProvider>(
  //         builder: (context, restaurantProv, _) {
  //           //* If review is null then fetch
  //           if (restaurantProv.reviewList == null) {
  //             restaurantProv.getReviewByResID(
  //                 widget.resultrating.id.toString(), context);
  //             return Center(
  //               child: CircularProgressIndicator(),
  //             );
  //           }

  //           //* If collection is not found
  //           if (restaurantProv.reviewList.length == 0) {
  //             return Center(
  //               child: Text("Belum ada review"),
  //             );
  //           }

  //           return ListView.builder(
  //             shrinkWrap: true,
  //             itemCount: restaurantProv.reviewList.length,
  //             physics: NeverScrollableScrollPhysics(),
  //             itemBuilder: (context, index) {
  //               var review = restaurantProv.reviewList[index];
  //               return ReviewItem(
  //                 review: review,
  //               );
  //             },
  //           );
  //         },
  //       );
  //     },
  //   );
  // }
}
