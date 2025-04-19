class UserModel {
  final String? email;
  final String? name;
  final String? password;
  final String? image;
  final String? phoneNumber;
  final String? address;

  UserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.image,
    required this.phoneNumber,
    required this.address
  });

  UserModel.createNewUser({
    required String email,
    required String name,
    required String password,
  })  : image = '',
        phoneNumber = '',
        address = '',
        email = email,
        name = name,
        password = password;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      password: json['password']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      phoneNumber: json['phoneNumber']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
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