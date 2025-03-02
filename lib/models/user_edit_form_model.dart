class UserEditFormModel {
  final String? username;
  final String? name;
  final String? email;
  final String? password;

  UserEditFormModel({
    this.name,
    this.username,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
