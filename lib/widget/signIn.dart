import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stocklearningapp/widget/api/api.dart';
import 'package:stocklearningapp/widget/customLoader.dart';
import 'package:stocklearningapp/widget/customOutlineButton.dart';
import 'package:stocklearningapp/widget/customRaisedButton.dart';
import 'package:stocklearningapp/widget/customTextField.dart';
import 'package:stocklearningapp/widget/customTextLink.dart';
import 'package:stocklearningapp/widget/logo.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';
import 'package:stocklearningapp/widget/routes.dart';

class SignIn extends StatefulWidget {

  Function onLogin;
  
  SignIn({ this.onLogin }):
    assert(onLogin != null);

  SignInState createState() => new SignInState();

}

class SignInState extends State<SignIn> {

  bool loggingIn;
  String email;
  String password;

  @override
  void initState() {
    super.initState();
    loggingIn = false;
    email = null;
    password = null;
  }

  @override
  Widget build(BuildContext context) {
    if (loggingIn) {
      return buildQuery(context);
    } else {
      return buildForm(context);
    }
  }

  Widget buildQuery(BuildContext context) {
    return Query(
        options: QueryOptions(
          documentNode: gql(loginQuery),
          variables: {
            "email": this.email,
            "password": this.password,
          },
          
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.loading) {
            return CustomLoader();
          } else if (result.data['login']['success']) {
            Future.delayed(Duration.zero, () {
              widget.onLogin.call(result.data['login']['token']);
              // showAlertDialog(context, 'Erro', 'Usuário e/ou senha incorretos', () {
              //   Navigator.pushNamed(context, signInRoute);
              // });
            });
            
            return buildForm(context);
          } else {
            Future.delayed(Duration.zero, () {
              showAlertDialog(context, 'Erro', 'Usuário e/ou senha incorretos', () {
                Navigator.pushNamed(context, signInRoute);
              });
            });
            return buildForm(context);
          }
        }
      );
  }

  Widget buildForm(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
              prefix: Icons.account_circle,
              controller: emailController,
            ),
            CustomTextField(
              color: textSecundaryColor,
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              label: 'Senha',
              prefix: Icons.vpn_key,
              obscureText: true,
              controller: passwordController,
            ),
            CustomRaisedButton(
              background: defaultColor,
              textColor: primaryColor,
              label: 'Acessar',
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              onPressed: () => {
                if (emailController.text != null && emailController.text.isNotEmpty && passwordController.text != null && passwordController.text.isNotEmpty) {
                  setState(() {
                    this.loggingIn = true;
                    this.email = emailController.text;
                    this.password = passwordController.text;
                  })
                }
              },
            ),
            CustomTextLink(
              label: 'Esqueceu a senha?',
              textColor: textSecundaryColor,
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              onPressed: () => {
                Navigator.pushNamed(context, passwordResetRoute)
              },
            ),
            CustomOutlineButton(
              background: defaultColor,
              textColor: textSecundaryColor,
              label: 'Crie sua conta',
              onPressed: () => {
                Navigator.pushNamed(context, signUpRoute)
              },
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            )
          ]
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String title, String content, Function onOk) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: onOk,
    );
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
