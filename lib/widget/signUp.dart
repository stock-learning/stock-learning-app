import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/customTextField.dart';
import 'package:stocklearningapp/widget/logo.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 120, left: 30, right: 30),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[primaryColor, secondaryColor])
        ),
        child: ListView(
          children: <Widget>[
            Logo(),
            CustomTextField(
              color: textSecundaryColor,
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              label: 'E-mail',
              prefix: Icons.account_circle
            ),
          ],
        ),
      ),
    );
  }
}