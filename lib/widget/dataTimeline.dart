import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/goingDown.dart';
import 'package:stocklearningapp/widget/goingUp.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';
import 'package:stocklearningapp/widget/models/dataTimeline.model.dart';

class DataTimeline extends StatelessWidget {
  DataTimelineModel model;

  DataTimeline({this.model}) : 
    assert(model != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: defaultColor,
        border: Border.all(
          color: Colors.blueGrey[300],
          width: 0.5
        )
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(bottom: 5, top: 5),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[Image.network(model.imageURL, height: 70)],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                model.name,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                model.initials,
                style: TextStyle(fontSize: 11, color: Colors.blueGrey[300]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                model.description,
                style: TextStyle(fontSize: 11, color: Colors.blueGrey[300]),
              ),
            ),
          ],
        ),
        getPercentage()
      ],
    ));
  }

  StatelessWidget getPercentage() {
    if ((model.isUp)) {
      return GoingUp(percentage: model.percentage);
    } else {
      return GoingDown(percentage: model.percentage);
    }
  }
}
