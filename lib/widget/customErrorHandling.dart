
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';

class CustomErrorHandling extends StatelessWidget {
  QueryResult exception;

  CustomErrorHandling({this.exception}):
    assert(exception != null);

  @override
  Widget build(BuildContext context) {
    return Container (
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(20),
      child: Text('Exception...\n' + exception.exception.toString(), style: TextStyle(color: textPrimaryColor)),
    );
  }
}