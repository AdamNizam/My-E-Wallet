class UserEditFormModel {
  String? username;
  String? name;
  String? email;
  String? password;

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
