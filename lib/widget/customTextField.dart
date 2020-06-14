import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  EdgeInsets padding;
  String label;
  Color color;
  IconData prefix;
  bool obscureText;

  CustomTextField({this.padding, this.label, this.color, this.prefix, this.obscureText}) : 
        assert(padding != null),
        assert(label != null),
        assert(color != null),
        assert(prefix != null);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        child: TextField(
          obscureText: getObscureText(),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: color),
            prefixIcon: Icon(prefix, color: color),
          ),
          style: TextStyle(color: color),
        ));
  }

  bool getObscureText() {
    return (obscureText == null) ? false : obscureText;
  }
}
