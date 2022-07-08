import 'package:graphql/client.dart';

import 'custom_graphql_client.dart';

class CustomGraphqlClientImpl implements CustomGraphqlClient {
  GraphQLClient get _getClient {
    final Link link = HttpLink(
      'https://app-ciphers.hasura.app/v1/graphql',
      defaultHeaders: {
        'x-hasura-admin-secret': 'fcLEQMvV6DOYjmpbFn3ozozlNj2UJejotlrBSJKw8isvgIJHm59gB8c1Hh1FReTU',
      },
    );
    return GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
  }

  @override
  Future<QueryResult> query({required String document, required Map<String, dynamic> variables}) async {
    return await _getClient.query(QueryOptions(document: gql(document), variables: variables));
  }
}
