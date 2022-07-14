class UserModel {
  final String name;
  final String email;
  final String jwt;
  final int id;

  UserModel({this.name = '', this.email = '', this.jwt = '', this.id = -1});

  UserModel copyWith({
    String? name,
    String? email,
    String? jwt,
    int? id,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      jwt: jwt ?? this.jwt,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? -1,
      name: map['user_name'] ?? '',
      email: map['user_email'] ?? '',
      jwt: map['jwt'] ?? '',
    );
  }

  @override
  String toString() => 'UserModel(id:$id name: $name, email: $email, jwt: $jwt)';
}
