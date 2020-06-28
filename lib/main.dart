import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/api/clientProvider.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';
import 'package:stocklearningapp/widget/routes.dart';
import 'package:stocklearningapp/widget/signIn.dart';

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClientProvider(
      uri: 'http://192.168.25.216:3000/',      
      subscriptionUri: 'ws://192.168.25.216:3000/graphql',
      child: MaterialApp(
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
        home: SignIn(),
        onGenerateRoute: routes(),
      )
    );
  }
}