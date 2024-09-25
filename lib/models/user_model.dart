class UserModel {
  final String? id;
  final String userName;
  final String email;
  final String password;

  UserModel({
    this.id,
    required this.userName,
    required this.email,
    required this.password,
  });

  toJson() {
    return {
      "UserName": userName,
      "Email": email,
      "Password": password,
    };
  }
}
