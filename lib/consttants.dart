import 'package:flutter/material.dart';

import 'models/resturantgooglemodel.dart';
// import 'package:location/location.dart';

const kBlackColor = Color(0xFF393939);
const kLightBlackColor = Color(0xFF8F8F8F);
const kIconColor = Color(0xFFF48A37);
const kProgressIndicator = Color(0xFFBE7066);

final kShadowColor = Color(0xFFD3D3D3).withOpacity(.84);
ResturantGoogleModel resturantGoogleModel;
// LocationData locationData;

String latitude = '00.00000';
String longitude = '00.00000';

// String loclatitude = "14.546188336029653";
// String loclongitude = "44.408628995647774";
String apikey = "AIzaSyBjCCuQL1P3qR6qti1Hh-eb5WwigF9F_84";
String publicurl =
    "https://maps.googleapis.com/maps/api/place/nearbysearch/json?";
