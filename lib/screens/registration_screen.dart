import 'package:email_validator/email_validator.dart';

import '../components/rounded_button.dart';
import '/constants.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextFormField(
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your email',
                label: const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) {
                return email != null && EmailValidator.validate(email)
                    ? null
                    : 'Please enter a valid email example: flash@gmail.com';
              },
              onChanged: (value) {
                //Do something with the user input
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your password',
                label: const Text(
                  'password',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              obscureText: true,
              onChanged: (value) {
                //Do something with the user input
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (password) {
                return password != null && password.length > 5
                    ? null
                    : 'The Password shoud be of 6 characters at least.';
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            Hero(
              tag: 'register',
              child: RoundedButton(
                color: kRegisterButtonColor,
                title: 'Register',
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 12),
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
