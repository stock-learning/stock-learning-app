import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


final HttpLink httpLink = HttpLink(uri: 'http://192.168.25.216:3000/graphql');
final AuthLink authLink = AuthLink(
  getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
);
final Link link = authLink.concat(httpLink);

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
