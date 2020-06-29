import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/api/clientProvider.dart';
import 'package:stocklearningapp/widget/dashboard.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';
import 'package:stocklearningapp/widget/routes.dart';
import 'package:stocklearningapp/widget/signIn.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {

  AppState createState() => new AppState();

}

class AppState extends State<App> {

  bool loggedIn;
  String token;

  @override
  void initState() {
    super.initState();
    this.loggedIn = false;
    this.token = null;
  }

  @override
  Widget build(BuildContext context) {
    if (this.loggedIn) {
      print('in');
      return buildLoggedInApp(context);
    } else {
      print('out');
      return buildLoggedOutApp(context);
    }
  }

  Widget buildLoggedInApp(BuildContext context) {
    return ClientProvider(
      uri: 'http://$hostApi/',      
      subscriptionUri: 'ws://$hostApi:3000/graphql',
      token: this.token,
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
        home: Dashboard(),
        onGenerateRoute: loggedInRoutes(),
      )
    );
  } 

  Widget buildLoggedOutApp(BuildContext context) {
    return ClientProvider(
      uri: 'http://$hostApi/',      
      subscriptionUri: 'ws://$hostApi:3000/graphql',
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
        home: SignIn(
          onLogin: (token) {
            setState(() {
              this.token = token;
              this.loggedIn = true;
            });
          }
        ),
        onGenerateRoute: loggedOutRoutes(),
      )
    );
  } 
}