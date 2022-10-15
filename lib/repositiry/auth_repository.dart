import 'package:mvvm/data/network/Baseapiservice.dart';
import 'package:mvvm/data/network/Networkapiservice.dart';
import 'package:mvvm/resources/app_url.dart';

class AuthRepository {
  BaseApiService _apiService = NetworkSrevices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw (e);
    }
  }
  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.registerApiUrl, data);
      return response;
    } catch (e) {
      throw (e);
    }
  }
}
