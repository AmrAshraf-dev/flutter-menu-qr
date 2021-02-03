import 'package:flutter/material.dart';
import 'package:location_menu_new/models/review_model.dart';
import 'package:location_menu_new/models/reviewsRatingGoogleModel.dart';
import 'custom_rating.dart';

class MyReviewItem extends StatelessWidget {
  Review myreview;
  Resultrating resultrating;
  MyReviewItem({@required this.myreview});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    _imageUser(),
                    SizedBox(width: 10),
                    _nameAndTime()
                  ],
                ),
              ),
              CustomRating(
                //resultrating.result.reviews
                rating: myreview.rating,
                useReview: false,
              ),
            ],
          ),
          SizedBox(height: 10),
          _captionField(),
          SizedBox(height: 10),
          Divider(color: Colors.black12),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _imageUser() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
          image:
              DecorationImage(image: NetworkImage(myreview.profilePhotoUrl))),
    );
  }

  Widget _nameAndTime() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            myreview.authorName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          Text(
            myreview.time,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black45, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _captionField() {
    return Container(
      child: Text(
        myreview.text,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.black54, fontSize: 13),
      ),
    );
  }
}
