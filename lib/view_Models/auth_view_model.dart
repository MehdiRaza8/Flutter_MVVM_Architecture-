import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/repositiry/auth_repository.dart';
import 'package:mvvm/utilis/utils.dart';

class AuthviewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo.loginApi(data).then((value) {
      if (kDebugMode) {}
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Utils.flashBarErrorMessage(error.toString(), context);
      }
    });
  }
}
