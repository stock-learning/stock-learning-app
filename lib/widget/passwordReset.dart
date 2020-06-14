import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/customRaisedButton.dart';
import 'package:stocklearningapp/widget/customTextField.dart';
import 'package:stocklearningapp/widget/logo.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';

class PasswordReset extends StatelessWidget {
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
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: defaultColor,
                borderRadius: BorderRadius.all(Radius.circular(2))
              ),
              child: Text(
                'Redefina sua senha',
                style: TextStyle(
                  color: textPrimaryColor,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                'Digite o endereço de e-mail da sua conta de usuário e enviaremos um link de redefinição de senha.',
                style: TextStyle(
                  color: textSecundaryColor,
                  fontSize: 15,
                  letterSpacing: 1.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            CustomTextField(
              color: textSecundaryColor,
              padding: EdgeInsets.only(left: 20, right: 20),
              label: 'E-mail',
              prefix: Icons.account_circle,
            ),
            CustomRaisedButton(
              background: defaultColor,
              textColor: primaryColor,
              label: 'Enviar e-mail de redefinição de senha',
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              onPressed: () => { print('enviar solicitação') },
            )
          ],
        ),
      ),
    );
  }
}