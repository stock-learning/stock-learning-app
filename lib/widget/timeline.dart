import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stocklearningapp/widget/customLoader.dart';

class Timeline extends StatelessWidget {

  Function(String) onSelectedCompany;
  Timeline({ this.onSelectedCompany });

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
          return CustomLoader();
        } else if (error != null) {
          return Text('Error\n' + error.toString());
        } else {
          return Text('Payload\n' + payload.toString());
        }
      },
    );
  }
}
