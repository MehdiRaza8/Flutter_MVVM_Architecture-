import 'dart:convert';
import 'dart:io';

import 'package:mvvm/data/network/Baseapiservice.dart';
import 'package:mvvm/data/network/response/app_exception.dart';
import 'package:http/http.dart' as http;

class NetworkSrevices extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet services');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      var response = await http
              .post(Uri.parse(url), body: data)
              .timeout(const Duration(seconds: 10)),
          // ignore: unused_local_variable
          responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet services');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accured while comminication with server' +
                'with status code ' +
                response.statusCode.toString());
    }
  }
}
