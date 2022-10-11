import 'package:flutter/material.dart';
import 'package:mvvm/utilis/Routs/routs_name.dart';
import 'package:mvvm/views/home_screen.dart';

import '../../views/login_screen.dart';

class Routs {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutsName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutsName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No routs defined')),
          );
        });
    }
  }
}
