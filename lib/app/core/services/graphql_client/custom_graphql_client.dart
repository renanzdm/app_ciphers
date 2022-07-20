import 'package:graphql/client.dart';

abstract class CustomGraphqlClient {
  Future<QueryResult> query({required String document, required Map<String, dynamic> variables});
  Future<QueryResult> mutation({required String document, required Map<String, dynamic> variables});
}
