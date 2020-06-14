import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/customRaisedButton.dart';
import 'package:stocklearningapp/widget/customTextField.dart';
import 'package:stocklearningapp/widget/logo.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 70, left: 30, right: 30),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[primaryColor, secondaryColor])
        ),
        child: ListView(
          children: <Widget>[
            Logo(),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: defaultColor,
                borderRadius: BorderRadius.all(Radius.circular(2))
              ),
              child: Text(
                'Crie sua conta',
                style: TextStyle(
                  color: textPrimaryColor,
                  fontSize: 20,
                ),
              ),
            ),
            CustomTextField(
              color: textSecundaryColor,
              padding: EdgeInsets.only(left: 20, right: 20),
              label: 'Nome completo',
              prefix: Icons.account_circle
            ),
            CustomTextField(
              color: textSecundaryColor,
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              label: 'E-mail',
              prefix: Icons.account_circle
            ),
            CustomTextField(
              color: textSecundaryColor,
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              label: 'Senha',
              prefix: Icons.vpn_key,
              obscureText: true
            ),
            CustomTextField(
              color: textSecundaryColor,
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              label: 'Confirme a senha',
              prefix: Icons.vpn_key,
              obscureText: true
            ),
            CustomRaisedButton(
              background: defaultColor,
              textColor: primaryColor,
              label: 'Criar',
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              onPressed: () => { print('criar') },
            ),
          ],
        ),
      ),
    );
  }
}