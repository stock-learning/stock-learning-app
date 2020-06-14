import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {

  EdgeInsets padding;
  String label;
  Color background;
  Color textColor;
  @required VoidCallback onPressed;

  CustomOutlineButton({this.padding, this.label, this.background, this.textColor, this.onPressed}) : 
        assert(padding != null),
        assert(label != null),
        assert(background != null),
        assert(textColor != null),
        assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        child: OutlineButton(
          child: Text(label),
          onPressed: onPressed,
          textColor: textColor,
          borderSide: BorderSide(color: background),
        ));
  }
}
