import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GeneralNews extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Subscription(
      "newLiveUpdate",
      """
      subscription newLiveUpdate {
        newLiveUpdate {
          message
        }
      }
      """,
      builder: ({
           bool loading,
           dynamic payload,
           dynamic error,
         }) {
          if (loading) {
            return Text('Loading');
          } else if (error != null) {
            return Text('Error\n' + error.toString());
          } else {
            return Text('Payload\n' + payload.toString());
          }
      }
    );
    // return Container(
    //   child: ListView(
    //     children: <Widget>[
    //       Container(
    //         padding: EdgeInsets.all(15),
    //         child: Tweets(),
    //       )
    //     ],
    //   )
    // );
  }

}