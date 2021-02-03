import 'package:http/http.dart' as http;
import '../consttants.dart';

var status;
var stateMsg;
var codest;
var connection;

getResturant(String url) async {
  {
    var tdata;
    await http
        .get(
      url,
    )
        .then((response) {
      tdata = response.body;
    }).timeout(
      Duration(seconds: 10),
      onTimeout: () {
        status = true;
        connection = true;

        return null;
      },
    );

    return tdata;
  }
}

getResturantKeyword(String keyword) async {
  {
    var tdata;
    await http
        .get(
      // "$publicurl&name=$keyword&location=$loclatitude,$loclongitude&radius=500&types=restaurant&key=$apikey",
      "$publicurl&name=$keyword&location=$latitude,$longitude&radius=500&types=restaurant&key=$apikey",
    )
        .then((response) {
      tdata = response.body;
    }).timeout(
      Duration(seconds: 10),
      onTimeout: () {
        status = true;
        connection = true;

        return null;
      },
    );

    return tdata;
  }
}
