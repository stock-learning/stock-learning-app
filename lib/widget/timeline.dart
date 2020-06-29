import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stocklearningapp/widget/api/api.dart';
import 'package:stocklearningapp/widget/customErrorHandling.dart';
import 'package:stocklearningapp/widget/customLoader.dart';
import 'package:stocklearningapp/widget/dataTimeline.dart';
import 'package:stocklearningapp/widget/models/dataTimeline.model.dart';

class Timeline extends StatelessWidget {

  Function(String) onSelectedCompany;
  Timeline({ this.onSelectedCompany });

  String getCurrentTime() {
    return DateFormat('dd/MM/yyyy hh:mm:ss').format(DateTime.now());
  }
  Widget buildTimeline(List<DataTimelineModel> model) {
    String time = this.getCurrentTime();
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Text(
              'Atualizado em ' + time,
              style: TextStyle(color: Colors.blueGrey[300]),
            )
          ]),
          Expanded(
            child: ListView.builder(
              itemCount: model.length,
              itemBuilder: (context, index) => DataTimeline(model: model[index], onSelectedCompany: this.onSelectedCompany),
            )
          )
        ],
      ),
    );    
  }

  Widget startTimeline() {
    return Query(options: QueryOptions(
      documentNode: gql(initialTimeline)
    ), builder: (result, {fetchMore, refetch}) {
      if (result.loading) {
        return CustomLoader();
      } else if (result.hasException) {
        return CustomErrorHandling(exception: result);
      } else {
        return buildTimeline(DataTimelineModel.convertModel(result));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Subscription(
      'newLiveUpdate',
      """
      subscription newLiveUpdate {
        newLiveUpdate {
          data {
            initials
            name
            logoUrl
            description
            porcentage
            isPositive
          }
        }
      }
      """,
      builder: ({loading, payload, error}) {
        if (loading) {
          return startTimeline();
        } else if (error != null) {
          return CustomErrorHandling(exception: error);
        } else {
          return buildTimeline(DataTimelineModel.convertDynamicModel(payload));
        }
      },
    );
  }
}
