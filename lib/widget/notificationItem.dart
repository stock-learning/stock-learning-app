import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationItem extends StatelessWidget {

  String dateTime;
  String text;

  NotificationItem({ this.dateTime, this.text });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          Text(
            DateFormat('dd/MM/yyyy – hh:mm').format(DateTime.parse(this.dateTime)),
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
              decoration: TextDecoration.none
            ),
          ),
          Text(
            this.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              decoration: TextDecoration.none
            ),
          ),
        ],
      )
    );
  }

}