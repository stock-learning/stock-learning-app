import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  EdgeInsets padding;
  String label;
  Color color;
  IconData prefix;

  CustomTextField({this.padding, this.label, this.color, this.prefix}) : 
        assert(padding != null),
        assert(label != null),
        assert(color != null),
        assert(prefix != null);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        child: TextField(
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: color),
            prefixIcon: Icon(prefix, color: color),
          ),
          style: TextStyle(color: color),
        ));
  }
}
