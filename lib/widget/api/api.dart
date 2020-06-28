import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


final HttpLink httpLink = HttpLink(uri: 'http://192.168.25.216:3000/');
final AuthLink authLink = AuthLink(
  getToken: () async => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJpZCBkbyB1c3XDoXJpbyIsImlhdCI6MTU5MzI5NzkyOSwiZXhwIjoxNTkzMzAxNTI5fQ.IrTHlwoUM-0GxPtb-Z39WjWVLqU-Tuuiu0GP01L9PbM',
);
final Link link = authLink.concat(httpLink);
// final SocketClient socketClient = SocketClient('ws://192.168.25.216:3000/graphql');

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: link, 
  ),
);  


final String flutterTeste = """
query {
  flutterTeste {
    message
  }
}
""";

final String companyDataByUser = """
query companyDataByUser(\$id: String!) {
  companyData(id: \$id) {
    initials
    name
    logoUrl
    description
  }
  userFollowCompany(companyId: \$id)
  companyStockCurrentValue(companyId: \$id)
}
""";

final String stockDataChartQuery = """
query stockDataChartQuery(\$companyId: String!, \$startDate: DateTime!, \$endDate: DateTime!) {

}
""";

final String tweetsByCompanyQuery = """
query tweetsByCompanyQuery(\$companyId: String!) {
  tweets(companyId: \$companyId) {
    account
    tweet
    createdAt
    statusId
  }
}
""";

final String allTweetsQuery = """
query tweetsByCompanyQuery {
  tweets {
    account
    cleanText
    createdAt
    statusId
  }
}
""";
