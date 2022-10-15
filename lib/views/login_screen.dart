// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:mvvm/resources/Components/round_button.dart';
import 'package:mvvm/utilis/utils.dart';
import 'package:mvvm/view_Models/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurepassword = ValueNotifier<bool>(true);
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _obsecurepassword.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authviewModel = Provider.of<AuthviewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
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
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurepassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      focusNode: _passwordFocusNode,
                      obscureText: _obsecurepassword.value,
                      obscuringCharacter: '*',
                      controller: _passwordcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Password",
                          label: const Text('Password'),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecurepassword.value =
                                    !_obsecurepassword.value;
                              },
                              child: Icon(_obsecurepassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility))),
                    );
                  }),
              SizedBox(
                height: height * .1,
              ),
              RoundedButton(
                title: 'Login',
                onPress: () {
                  if (_emailcontroller.text.isEmpty) {
                    Utils.flashBarErrorMessage('Please Enter Email', context);
                  } else if (_passwordcontroller.text.isEmpty) {
                    Utils.flashBarErrorMessage('Please Password', context);
                  } else if (_passwordcontroller.text.length < 6) {
                    Utils.flashBarErrorMessage(
                        'Atleast 6 Charactor Password', context);
                  } else {
                    var data = {
                      'email': _emailcontroller.text.toString(),
                      'password': _passwordcontroller.text.toString()
                    };
                    authviewModel.loginApi(data, context);
                    print('data');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
