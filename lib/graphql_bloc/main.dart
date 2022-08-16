// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
Future<GraphQLProvider> main() async {
  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();
  final HttpLink httpLink =
      HttpLink('https://enthms-graphql.safiwis.com/v1/graphql');
  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );
  final Link link = authLink.concat(httpLink);
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
    
  );
  return GraphQLProvider(
    client: client,
    child: MaterialApp(),
  );

}
