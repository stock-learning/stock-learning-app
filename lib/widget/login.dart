import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/customOutlineButton.dart';
import 'package:stocklearningapp/widget/customRaisedButton.dart';
import 'package:stocklearningapp/widget/customTextField.dart';
import 'package:stocklearningapp/widget/logo.dart';
import 'package:stocklearningapp/widget/textLink.dart';
import 'models/constants.model.dart';

class Login extends StatelessWidget {
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
            CustomTextField(
              color: textSecundaryColor,
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              label: 'Senha',
              prefix: Icons.vpn_key
            ),
            CustomRaisedButton(
              background: defaultColor,
              textColor: primaryColor,
              label: 'Acessar',
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              onPressed: () => { _showTest(context) },
            ),
            TextLink(
              label: 'Esqueceu a senha?',
              textColor: textSecundaryColor,
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              onPressed: () => { _showTest(context) },
            ),
            CustomOutlineButton(
              background: defaultColor,
              textColor: textSecundaryColor,
              label: 'Criar uma conta',
              onPressed: () => { _showTest(context) },
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            )
          ]
        ),
      ),
    );
  }
  
  Future<void> _showTest(BuildContext context) {
    const alertDialog = AlertDialog(
      title: Text('Titulo teste'),
      content: Text('Conteudo...')
    );

    showDialog(
      context: context,
      builder: (BuildContext context) => alertDialog
    );
  }
}
