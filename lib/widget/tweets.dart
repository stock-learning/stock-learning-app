import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stocklearningapp/widget/api/api.dart';
import 'package:stocklearningapp/widget/descriptionText.dart';
import 'package:stocklearningapp/widget/loading.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';
import 'package:url_launcher/url_launcher.dart';

class Tweets extends StatelessWidget {

  String companyId;

  Tweets({ this.companyId });

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: gql(allTweetsQuery),
      ),
      builder: (QueryResult result, {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.loading) {
          return this.buildLoading();
        } else if (result.hasException) {
          return this.buildError(result);
        } else {
          return this.buildCompanyData(context, result);
        }
      }
    );
  }

  Widget buildLoading() {
    return Container(
      child: Loading(),
    );
  }

  Widget buildError(QueryResult result) {
    return Container(
      child: Text('Exception...\n' + result.exception.toString()),
    );
  }

  Widget buildCompanyData(BuildContext context, QueryResult result) {
    final tweetViews = <Widget>[];

    result.data['tweets'].forEach((tweet) {
      tweetViews.add(this.buildTweetCard(tweet));
    });

    return Container(
      child: Column(
        children: tweetViews,
      ),
    );
  }

  Widget buildTweetCard(tweet) {
    return Container(
      child: InkWell(
        onTap: () async {
          final url = 'https://twitter.com/${tweet['account']}/status/${tweet['statusId']}';
          if (await canLaunch(url)) {
            await launch(url);
          }
        },
        child: Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '@${tweet['account']}',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      DateFormat('dd-MM-yyyy – hh:mm').format(DateTime.parse(tweet['createdAt'])),
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 12
                      ),
                    ),
                  ),
                ],
              ),
              DescriptionText(
                text: tweet['cleanText'],
              )
            ],
          )
        )
      ),
    );
  }

}