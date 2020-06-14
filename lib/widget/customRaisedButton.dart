import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  EdgeInsets padding;
  String label;
  Color background;
  Color textColor;
  @required VoidCallback onPressed;

  CustomRaisedButton({this.padding, this.label, this.background, this.textColor, this.onPressed}) : 
        assert(padding != null),
        assert(label != null),
        assert(background != null),
        assert(textColor != null),
        assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        child: RaisedButton(
          child: Text(label),
          onPressed: onPressed,
          color: background,
          textColor: textColor,
        ));
  }
}
