import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String uuidFromObject(Object object) {
  if (object is Map<String, Object>) {
    final String typeName = object['__typename'] as String;
    final String id = object['id'].toString();
    if (typeName != null && id != null) {
      return <String>[typeName, id].join('/');
    }
  }
  return null;
}

final OptimisticCache cache = OptimisticCache(
  dataIdFromObject: uuidFromObject,
);

ValueNotifier<GraphQLClient> clientFor({
  @required String uri,
  String subscriptionUri,
}) {
  Link link = HttpLink(uri: uri);
  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJpZCBkbyB1c3XDoXJpbyIsImlhdCI6MTU5MzI5NzkyOSwiZXhwIjoxNTkzMzAxNTI5fQ.IrTHlwoUM-0GxPtb-Z39WjWVLqU-Tuuiu0GP01L9PbM',
  );
  link = link.concat(authLink);
  if (subscriptionUri != null) {
    final WebSocketLink websocketLink = WebSocketLink(
      url: subscriptionUri,
      config: SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: Duration(seconds: 30),
        initPayload: {
          'authToken': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJpZCBkbyB1c3XDoXJpbyIsImlhdCI6MTU5MzI5NzkyOSwiZXhwIjoxNTkzMzAxNTI5fQ.IrTHlwoUM-0GxPtb-Z39WjWVLqU-Tuuiu0GP01L9PbM',
        }
      ),
    );

    link = link.concat(websocketLink);
  }

  return ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: cache,
      link: link,
    ),
  );
}

/// Wraps the root application with the `graphql_flutter` client.
/// We use the cache for all state management.
class ClientProvider extends StatelessWidget {
  ClientProvider({
    @required this.child,
    @required String uri,
    String subscriptionUri,
  }) : client = clientFor(
          uri: uri,
          subscriptionUri: subscriptionUri,
        );

  final Widget child;
  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: child,
    );
  }
}