import 'package:flutter/material.dart';

class GoingDown extends StatelessWidget {
  double percentage;

  GoingDown({this.percentage}):
    assert(percentage != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(Icons.arrow_downward, color: Colors.redAccent[700], size: 50),
        Text(
          percentage.toString(),
          style: TextStyle(
            color: Colors.redAccent[700],
            fontSize: 20
          ),
        )
      ],
    );
  }
}