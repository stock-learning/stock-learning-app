import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stocklearningapp/widget/api/api.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';
import 'package:stocklearningapp/widget/routes.dart';
import 'package:stocklearningapp/widget/signIn.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
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