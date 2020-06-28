
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';

class CustomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: CircularProgressIndicator(
              backgroundColor: Colors.blueGrey[300],
              valueColor: AlwaysStoppedAnimation<Color>(secondaryColor)
            )
    );
  }  
}