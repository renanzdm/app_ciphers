// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:the_cipher_app/app/core/error/base_error.dart';
import 'package:the_cipher_app/app/core/model/user_model.dart';

import '../../../core/services/graphql_client/custom_graphql_client.dart';
import '../auth_errors/auth_errors.dart';

abstract class AuthRepositorie {
  Future<Either<BaseError, String>> login({required String email, required String password});
  Future<Either<BaseError, UserModel>> register({required String email, required String password, required String name});
}

class AuthRepositorieImpl implements AuthRepositorie {
  final CustomGraphqlClient _graphqlClient;
  AuthRepositorieImpl({
    required CustomGraphqlClient graphqlClient,
  }) : _graphqlClient = graphqlClient;

  @override
  Future<Either<BaseError, String>> login({required String email, required String password}) async {
    try {
      String document = r'''query MyQuery($email: String!,$password: String!) {
        Sign(email: $email, password: $password) {
          token
        }
      }''';
      Map<String, String> variables = {'email': email, 'password': password};
      var response = await _graphqlClient.query(document: document, variables: variables);
      if (response.data != null) {
        return right(response.data!['Sign']);
      } else {
        return left(RegisterError(message: response.exception?.graphqlErrors.first.toString() ?? 'Erro'));
      }
    } catch (e, s) {
      return left(LoginError(ex: e, stack: s));
    }
  }

  @override
  Future<Either<BaseError, UserModel>> register({required String email, required String password, required String name}) async {
    try {
      String document = r'''mutation MyMutation($name: String!, $email: String!, $password: String!) {
        Signup(email: $email, name: $name, password: $password) {
          email
          id
      }
        }''';
      Map<String, String> variables = {'name': name, 'email': email, 'password': password};
      var response = await _graphqlClient.mutation(document: document, variables: variables);

      if (response.data != null) {
        final user = UserModel.fromMap(response.data!['Signup']);
        return right(user);
      } else {
        return left(RegisterError(message: response.exception?.graphqlErrors.first.toString() ?? 'Erro'));
      }
    } catch (e, s) {
      return left(RegisterError(ex: e, stack: s));
    }
  }
}
