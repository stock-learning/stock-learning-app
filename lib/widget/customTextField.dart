import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  EdgeInsets padding;
  String label;
  Color color;
  IconData prefix;
  bool obscureText;
  String text;
  TextEditingController controller;
  String Function(String) validator;

  CustomTextField({
    this.padding,
    this.label,
    this.color,
    this.prefix,
    this.obscureText,
    this.validator,
    this.controller,
    this.text = "",
  }) : 
        assert(padding != null),
        assert(label != null),
        assert(color != null),
        assert(prefix != null);

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
       controller = TextEditingController();
    }
    controller.text = this.text;
    return Container(
        padding: padding,
        child: TextFormField(
          validator: validator,
          controller: controller,
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
