import 'package:flutter/material.dart';
import 'widget/models/constants.model.dart';
import 'widget/dashboard.dart';
import 'widget/login.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: textSecundaryColor,
        hintColor: textSecundaryColor,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: textSecundaryColor)
          )
        ),
        fontFamily: font,
      ),
      home: Login()
    );
  }
}