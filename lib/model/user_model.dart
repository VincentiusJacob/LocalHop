class UserModel {
  final String email;
  final String name;
  final String password;

  UserModel({
    required this.email,
    required this.name,
    required this.password,
  });


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      name: json['name'] as String,
      password: json['password'] as String
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'password': password,
    };
  }
}