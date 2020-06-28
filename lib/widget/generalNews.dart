import 'package:flutter/cupertino.dart';
import 'package:stocklearningapp/widget/tweets.dart';

class GeneralNews extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Tweets(),
          )
        ],
      )
    );
  }

}