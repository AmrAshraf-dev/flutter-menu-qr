// To parse this JSON data, do
//
//     final resturantGoogleModel = resturantGoogleModelFromJson(jsonString);

import 'dart:convert';

import 'package:location_menu_new/models/review_model.dart';

ResturantGoogleModel resturantGoogleModelFromJson(String str) =>
    ResturantGoogleModel.fromJson(json.decode(str));

String resturantGoogleModelToJson(ResturantGoogleModel data) =>
    json.encode(data.toJson());

class ResturantGoogleModel {
  ResturantGoogleModel({
    this.htmlAttributions,
    this.results,
    this.status,
  });

  List<dynamic> htmlAttributions;
  List<Result> results;
  String status;

  factory ResturantGoogleModel.fromJson(Map<String, dynamic> json) =>
      ResturantGoogleModel(
        htmlAttributions: json["html_attributions"] == null
            ? null
            : List<dynamic>.from(json["html_attributions"].map((x) => x)),
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "html_attributions": htmlAttributions == null
            ? null
            : List<dynamic>.from(htmlAttributions.map((x) => x)),
        "results": results == null
            ? null
            : List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status == null ? null : status,
      };
}

class Result {
  Result({
    this.businessStatus,
    this.geometry,
    this.icon,
    this.name,
    this.placeId,
    this.plusCode,
    this.reference,
    this.scope,
    this.types,
    this.vicinity,
    this.photos,
    this.rating,
    this.userRatingsTotal,
    this.openingHours,
    // this.review,
    // this.priceForTwo,
    // this.address,
    // this.addressFull,
    // this.openTime,
    // this.currency,
    // this.highlights,
  });

  BusinessStatus businessStatus;
  Geometry geometry;
  String icon;
  String name;
  String placeId;
  PlusCode plusCode;
  String reference;
  Scope scope;
  List<Type> types;
  String vicinity;
  List<Photo> photos;
  double rating;
  int userRatingsTotal;
  OpeningHours openingHours;

  // ReviewModel review;
  // int priceForTwo;
  // String address;
  // String addressFull;
  // String openTime;
  // String currency;
  // List<String> highlights;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        businessStatus: json["business_status"] == null
            ? null
            : businessStatusValues.map[json["business_status"]],
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
        icon: json["icon"] == null ? null : json["icon"],
        name: json["name"] == null ? null : json["name"],
        placeId: json["place_id"] == null ? null : json["place_id"],
        plusCode: json["plus_code"] == null
            ? null
            : PlusCode.fromJson(json["plus_code"]),
        reference: json["reference"] == null ? null : json["reference"],
        scope: json["scope"] == null ? null : scopeValues.map[json["scope"]],
        types: json["types"] == null
            ? null
            : List<Type>.from(json["types"].map((x) => typeValues.map[x])),
        vicinity: json["vicinity"] == null ? null : json["vicinity"],
        photos: json["photos"] == null
            ? null
            : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        rating: json["rating"] == null ? 0 : json["rating"].toDouble(),
        userRatingsTotal: json["user_ratings_total"] == null
            ? null
            : json["user_ratings_total"],
        openingHours: json["opening_hours"] == null
            ? null
            : OpeningHours.fromJson(json["opening_hours"]),

        // review: json["user_rating"] == null
        //     ? null
        //     : ReviewModel.fromJson(json["user_rating"]),
        // priceForTwo: json["average_cost_for_two"] == null
        //     ? null
        //     : json["average_cost_for_two"],
        // address: json["location"]["locality_verbose"] == null
        //     ? null
        //     : json["location"]["locality_verbose"],
        // addressFull: json["location"]["address"] == null
        //     ? null
        //     : json["location"]["address"],
        // openTime: json["timings"] == null ? null : json["timings"],
        // currency: json["currency"] == null ? null : json["currency"],
      );

  get reviews => null;

  Map<String, dynamic> toJson() => {
        "business_status": businessStatus == null
            ? null
            : businessStatusValues.reverse[businessStatus],
        "geometry": geometry == null ? null : geometry.toJson(),
        "icon": icon == null ? null : icon,
        "name": name == null ? null : name,
        "place_id": placeId == null ? null : placeId,
        "plus_code": plusCode == null ? null : plusCode.toJson(),
        "reference": reference == null ? null : reference,
        "scope": scope == null ? null : scopeValues.reverse[scope],
        "types": types == null
            ? null
            : List<dynamic>.from(types.map((x) => typeValues.reverse[x])),
        "vicinity": vicinity == null ? null : vicinity,
        "photos": photos == null
            ? null
            : List<dynamic>.from(photos.map((x) => x.toJson())),
        "rating": rating == null ? null : rating,
        "user_ratings_total":
            userRatingsTotal == null ? null : userRatingsTotal,
        "opening_hours": openingHours == null ? null : openingHours.toJson(),

        // "user_rating": review == null ? null : review,
        // "average_cost_for_two": priceForTwo == null ? null : priceForTwo,
      };
}

enum BusinessStatus { OPERATIONAL }

final businessStatusValues =
    EnumValues({"OPERATIONAL": BusinessStatus.OPERATIONAL});

class Geometry {
  Geometry({
    this.location,
    this.viewport,
  });

  Location location;
  Viewport viewport;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        viewport: json["viewport"] == null
            ? null
            : Viewport.fromJson(json["viewport"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location == null ? null : location.toJson(),
        "viewport": viewport == null ? null : viewport.toJson(),
      };
}

class Location {
  Location({
    this.lat,
    this.lng,
  });

  double lat;
  double lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
      };
}

class Viewport {
  Viewport({
    this.northeast,
    this.southwest,
  });

  Location northeast;
  Location southwest;

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: json["northeast"] == null
            ? null
            : Location.fromJson(json["northeast"]),
        southwest: json["southwest"] == null
            ? null
            : Location.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast == null ? null : northeast.toJson(),
        "southwest": southwest == null ? null : southwest.toJson(),
      };
}

class OpeningHours {
  OpeningHours({
    this.openNow,
  });

  bool openNow;

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
        openNow: json["open_now"] == null ? null : json["open_now"],
      );

  Map<String, dynamic> toJson() => {
        "open_now": openNow == null ? null : openNow,
      };
}

class Photo {
  Photo({
    this.height,
    this.htmlAttributions,
    this.photoReference,
    this.width,
  });

  int height;
  List<String> htmlAttributions;
  String photoReference;
  int width;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        height: json["height"] == null ? null : json["height"],
        htmlAttributions: json["html_attributions"] == null
            ? null
            : List<String>.from(json["html_attributions"].map((x) => x)),
        photoReference:
            json["photo_reference"] == null ? null : json["photo_reference"],
        width: json["width"] == null ? null : json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height == null ? null : height,
        "html_attributions": htmlAttributions == null
            ? null
            : List<dynamic>.from(htmlAttributions.map((x) => x)),
        "photo_reference": photoReference == null ? null : photoReference,
        "width": width == null ? null : width,
      };
}

class PlusCode {
  PlusCode({
    this.compoundCode,
    this.globalCode,
  });

  String compoundCode;
  String globalCode;

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
        compoundCode:
            json["compound_code"] == null ? null : json["compound_code"],
        globalCode: json["global_code"] == null ? null : json["global_code"],
      );

  Map<String, dynamic> toJson() => {
        "compound_code": compoundCode == null ? null : compoundCode,
        "global_code": globalCode == null ? null : globalCode,
      };
}

enum Scope { GOOGLE }

final scopeValues = EnumValues({"GOOGLE": Scope.GOOGLE});

enum Type { RESTAURANT, FOOD, POINT_OF_INTEREST, ESTABLISHMENT }

final typeValues = EnumValues({
  "establishment": Type.ESTABLISHMENT,
  "food": Type.FOOD,
  "point_of_interest": Type.POINT_OF_INTEREST,
  "restaurant": Type.RESTAURANT
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
