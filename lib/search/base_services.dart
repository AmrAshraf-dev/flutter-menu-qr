import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'core/config_services.dart';

// import 'package:resturantfinder/core/services/base/config_services.dart';
// import 'package:resturantfinder/core/utils/auth_utils.dart';
// import 'package:resturantfinder/core/utils/dialog_utils.dart';
// import 'package:resturantfinder/ui/router/router_generator.dart';

enum RequestType { GET, POST, DELETE }

class BaseServices {
  Dio _dio = new Dio();
  Options _headersOption;

  Future _getToken() async {
    var _token =
        'fc68be1d61bd6d98e83e55c165fd74f7'; //await AuthUtils.instance.getToken();
    _headersOption = ConfigServices.getHeaders(token: _token);
  }

  Future<dynamic> request(String url, RequestType type, BuildContext context,
      {dynamic data, bool useToken}) async {
    var response;

    //If this route use token then fetch token
    if (useToken != null && useToken) {
      await _getToken();
    } else {
      _headersOption = ConfigServices.getHeaders();
    }

    try {
      switch (type) {
        case RequestType.POST:
          response = await _dio.post(url,
              data: data != null ? data : null, options: _headersOption);
          break;
        case RequestType.GET:
          response = await _dio.get(url, options: _headersOption);
          print('gggg : $url');
          print('vvvvvv : ${_headersOption.headers.toString()}');
          break;
        case RequestType.DELETE:
          response = await _dio.delete(url,
              data: data != null ? data : null, options: _headersOption);
          break;
      }
    } on DioError catch (e) {
      response = e.response;
    }

    //* Handling error and status code
    //print(response);
    response = json.decode(response.toString());

    //* if 401 then return to login
    if (response["code"] == 403) {
      // DialogUtils.instance.showInfo(
      //     context,
      //     "Session Expired, silahkan masukkan api key yang valid",
      //     Icons.error,
      //     "OK", onClick: () async {
      //   Navigator.pushNamedAndRemoveUntil(
      //       context, RouterGenerator.routeHome, (route) => false);
      // });
      return null;
    }
    // print(response);
    return response;
  }
}
