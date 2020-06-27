import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stocklearningapp/widget/api/api.dart';

class Company extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Query(
      options: QueryOptions(documentNode: gql(flutterTeste), pollInterval: 1),
      builder: (QueryResult result, {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.loading) {
          return Container(
            child: Text('Loading...'),
          );
        } else if (result.hasException) {
          return Container(
            child: Text('Exception...\n' + result.exception.toString()),
          );
        } else {
          return Container(
            child: Text(result.data['flutterTeste']['message']),
            // child: ListView(
            // children: <Widget>[
            //     CompanyLogo(),
            //   ],
            // )
          );
        }
      }
    );
  }
}
