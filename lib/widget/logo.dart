import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
    children: <Widget>[
      Image.asset(imagePath, fit: BoxFit.contain, height: 100),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Text(title,
            style: TextStyle(
                color: textSecundaryColor,
                letterSpacing: 1.0,
                fontSize: 30.0,
                fontWeight: FontWeight.w500)),
        Text(
          subtitle,
          style: TextStyle(color: textSecundaryColor, letterSpacing: 1.0),
        )
      ])
    ]);
  }
}
