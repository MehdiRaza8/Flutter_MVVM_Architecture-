import 'package:flutter/material.dart';
import 'package:mvvm/utilis/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailcontroller,
                focusNode: _emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Email",
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, _emailFocusNode, _passwordFocusNode);
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                focusNode: _passwordFocusNode,
                obscureText: true,
                obscuringCharacter: '*',
                controller: _passwordcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Password",
                  label: Text('Password'),
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
