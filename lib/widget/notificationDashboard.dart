import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stocklearningapp/widget/api/api.dart';
import 'package:stocklearningapp/widget/customLoader.dart';
import 'package:stocklearningapp/widget/notificationItem.dart';

class NotificationDashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: gql(currentUserNotification)
      ),
      builder: (QueryResult result, {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.loading) {
          return this.buildLoading();
        } else if (result.hasException) {
          return this.buildError(result);
        } else {
          return this.buildNotificationList(result);
        }
      }
    );
  }
  
  Widget buildLoading() {
    return CustomLoader();
  }

  Widget buildError(QueryResult result) {
    return Container(
      child: Text(
        result.exception.toString(),
        style: TextStyle(
          color: Colors.black.withOpacity(0.8),
          fontSize: 20,
          decoration: TextDecoration.none
        ),  
      ),
      
    );
  }

  Widget buildNotificationList(QueryResult result) {
    return ClipRect(
      child: Container(
        width: 200,
        height: 200,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: Colors.black.withOpacity(0.8),
            // padding: EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 15),
            padding: EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: result.data['currentUserNotification'].length,
              itemBuilder: (context, index) => NotificationItem(
                dateTime: result.data['currentUserNotification'][index]['dateTime'],
                text: result.data['currentUserNotification'][index]['text'],
              )
            )
          ),
        ),
      ),
    );
  }

}