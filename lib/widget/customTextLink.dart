import 'package:flutter/material.dart';

class CustomTextLink extends StatelessWidget {

  EdgeInsets padding;
  String label;
  Color textColor;
  @required VoidCallback onPressed;

  CustomTextLink({this.padding, this.label, this.textColor, this.onPressed}) : 
        assert(padding != null),
        assert(label != null),
        assert(textColor != null),
        assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        padding: padding,
        child: GestureDetector(
          child: Text(label, style: TextStyle(color: textColor)),
          onTap: onPressed,
        )
      );
  }
}
