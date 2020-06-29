import 'package:flutter/material.dart';

class GoingUp extends StatelessWidget {
  String percentage;

  GoingUp({this.percentage}):
    assert(percentage != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          percentage + '%',
          style: TextStyle(
            color: Colors.green,
            fontSize: 20
          ),
        ),
        Icon(Icons.arrow_upward, color: Colors.green, size: 50)
      ],
    );
  }
}