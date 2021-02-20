class OurModel {
  int id;
  String name;
  String subdomain;
  String logo;
  String cover;
  int active;
  double user_id;
  String lat;
  String lng;
  String address;
  String phone;
  String minimum;
  String description;
  double fee;

  OurModel({
    this.id,
    this.name,
    this.subdomain,
    this.logo,
    this.cover,
    this.active,
    this.user_id,
    this.lat,
    this.lng,
    this.address,
    this.phone,
    this.minimum,
    this.description,
    this.fee,
  });

  factory OurModel.fromJson(Map<String, dynamic> json) => OurModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        subdomain: json["subdomain"] == null ? null : json["subdomain"],
        logo: json["logo"] == null ? null : json["logo"],
        cover: json["cover"] == null ? null : json["cover"],
        active: json["active"] == null ? null : json["active"],
        user_id: json["user_id"] == null ? null : json["user_id"],
        lat: json["lat"] == null ? null : json["lat"],
        lng: json["lng"] == null ? null : json["lng"],
        address: json["address"] == null ? null : json["address"],
        phone: json["phone"] == null ? null : json["phone"],
        minimum: json["minimum"] == null ? null : json["minimum"],
        description: json["description"] == null ? null : json["description"],
        fee: json["fee"] == null ? null : json["fee"],
      );

  //get reviews => null;

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "subdomain": subdomain == null ? null : subdomain,
        "logo": logo == null ? null : logo,
        "cover": cover == null ? null : cover,
        "active": active == null ? null : active,
        "user_id": user_id == null ? null : user_id,
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
        "address": address == null ? null : address,
        "phone": phone == null ? null : phone,
        "minimum": minimum == null ? null : minimum,
        "description": description == null ? null : description,
        "fee": fee == null ? null : fee,
      };
}
