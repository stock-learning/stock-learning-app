import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';
import 'package:stocklearningapp/widget/signIn.dart';
import 'package:stocklearningapp/widget/signUp.dart';

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
      home: SignIn()
    );
  }
}