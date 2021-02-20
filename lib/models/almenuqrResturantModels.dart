// To parse this JSON data, do
//
//     final almenuqrResturantModels = almenuqrResturantModelsFromMap(jsonString);

import 'dart:convert';

import 'package:location_menu_new/models/resturantgooglemodel.dart';

List<AlmenuqrResturantModels> almenuqrResturantModelsFromMap(String str) =>
    List<AlmenuqrResturantModels>.from(
        json.decode(str).map((x) => AlmenuqrResturantModels.fromMap(x)));

String almenuqrResturantModelsToMap(List<AlmenuqrResturantModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class AlmenuqrResturantModels {
  AlmenuqrResturantModels({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.subdomain,
    this.logo,
    this.cover,
    this.active,
    this.userId,
    this.lat,
    this.lng,
    this.address,
    this.phone,
    this.minimum,
    this.description,
    this.fee,
    this.staticFee,
    this.radius,
    this.isFeatured,
    this.cityId,
    this.results2,
  });

  List<Result> results2;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String subdomain;
  String logo;
  String cover;
  int active;
  String userId;
  String lat;
  String lng;
  String address;
  String phone;
  String minimum;
  String description;
  String fee;
  String staticFee;
  String radius;
  String isFeatured;
  String cityId;

  factory AlmenuqrResturantModels.fromMap(Map<String, dynamic> json) =>
      AlmenuqrResturantModels(
        id: json["id"].toString(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        name: json["name"],
        subdomain: json["subdomain"],
        logo: json["logo"],
        cover: json["cover"],
        active: json["active"],
        userId: json["user_id"].toString(),
        lat: json["lat"],
        lng: json["lng"],
        address: json["address"],
        phone: json["phone"],
        minimum: json["minimum"],
        description: json["description"],
        fee: json["fee"].toString(),
        staticFee: json["static_fee"].toString(),
        radius: json["radius"].toString(),
        isFeatured: json["is_featured"].toString(),
        cityId: json["city_id"] == null ? null : json["city_id"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "name": name,
        "subdomain": subdomain,
        "logo": logo,
        "cover": cover,
        "active": active,
        "user_id": userId,
        "lat": lat,
        "lng": lng,
        "address": address,
        "phone": phone,
        "minimum": minimum,
        "description": description,
        "fee": fee,
        "static_fee": staticFee,
        "radius": radius,
        "is_featured": isFeatured,
        "city_id": cityId == null ? null : cityId,
      };
}
