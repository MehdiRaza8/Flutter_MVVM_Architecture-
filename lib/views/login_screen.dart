import 'package:flutter/material.dart';
import 'package:mvvm/utilis/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: InkWell(
                  onTap: () {
                    Utils.flashBarErrorMessage(
                        'No internet Conection', context);
                  },
                  child: Text('Click')))
        ],
      ),
    );
  }
}
