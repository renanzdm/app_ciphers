import 'package:graphql/client.dart';
import 'package:the_cipher_app/app/core/services/remote_config/custom_remote_config.dart';

import 'custom_graphql_client.dart';

class CustomGraphqlClientImpl implements CustomGraphqlClient {
  final CustomRemoteConfig customRemoteConfig;
  CustomGraphqlClientImpl({required this.customRemoteConfig});
  GraphQLClient? _graphQLClient;

  Future<GraphQLClient> get _getClient async {
    if (_graphQLClient != null) {
      return _graphQLClient!;
    }
    final hasuraLink = await customRemoteConfig.fetchString(key: 'hasura_link');
    final hasuraAdminSecret = await customRemoteConfig.fetchString(key: 'x_hasura_admin_secret');
    final Link link = HttpLink(
      hasuraLink,
      defaultHeaders: {
        'x-hasura-admin-secret': hasuraAdminSecret,
      },
    );
    _graphQLClient = GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
    return _graphQLClient!;
  }

  @override
  Future<QueryResult> query({required String document, Map<String, dynamic> variables = const {}}) async {
    final client = await _getClient;
    return await client.query(QueryOptions(document: gql(document), variables: variables));
  }
}
