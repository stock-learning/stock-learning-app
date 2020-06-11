import 'package:flutter/material.dart';
import 'widget/dashboard.dart';
import 'widget/login.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Learning',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        hintColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          )
        ),
        fontFamily: 'frutiger',
      ),
      home: Login()
    );
  }
}