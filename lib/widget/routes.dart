import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stocklearningapp/widget/accountForm.dart';
import 'package:stocklearningapp/widget/dashboard.dart';
import 'package:stocklearningapp/widget/passwordReset.dart';
import 'package:stocklearningapp/widget/signIn.dart';
import 'package:stocklearningapp/widget/signUp.dart';

const homePageRoute = '/dashboard';
const signInRoute = '/signIn';
const signUpRoute = '/signUp';
const passwordResetRoute = '/passwordReset';
const accountFormRoute = '/accountForm';

RouteFactory routes() {
  return (settings) {
    // final Map<String, dynamic> arguments = settings.arguments;
    
    Widget screen;
    switch(settings.name) {
      case homePageRoute:
        screen = Dashboard();
        break;
      case signInRoute:
        screen = SignIn();
        break;
      case signUpRoute:
        screen = SignUp();
        break;
      case passwordResetRoute:
        screen = PasswordReset();
        break;
      case accountFormRoute:
        screen = AccountForm();
        break;
      default:
        screen = SignIn();
        break;
    }

    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}