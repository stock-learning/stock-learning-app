import 'package:flutter/material.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset('images/logo.png', fit: BoxFit.contain, height: 100),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Stock Learning', 
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500
                      )
                    ),
                    Text(
                      'Automated Trading',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.0
                      ),
                    )
                  ]
                )
              ]
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField (
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.account_circle, color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              ) 
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextField (
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.vpn_key, color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              ) 
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: RaisedButton(
                child: Text('Acessar'),
                onPressed: () => {

                },
                color: Colors.white,
                textColor: primaryColor,
              )
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text('Esqueceu a senha?', style: TextStyle(color: Colors.white))
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: OutlineButton(
                child: Text('Criar uma conta'),
                onPressed: () => {

                },
                textColor: Colors.white,
                borderSide: BorderSide(color: Colors.white),
                
              )
            )
          ]
        ),
      ),
    );
  }
}
