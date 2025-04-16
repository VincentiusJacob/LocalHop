class UserModel {
  final String email;
  final String name;
  final String password;
  final double weight;
  final double height;
  final String workoutIntensity; // contoh: 'ringan', 'sedang', 'berat'
  final List<String> workoutRecommendations;
  final List<String> foodRecommendations;

  UserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.weight,
    required this.height,
    required this.workoutIntensity,
    required this.workoutRecommendations,
    required this.foodRecommendations,
  });

  // Factory method untuk parsing dari JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      name: json['name'] as String,
      password: json['password'] as String,
      weight: (json['weight'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      workoutIntensity: json['workoutIntensity'] as String,
      workoutRecommendations: List<String>.from(json['workoutRecommendations']),
      foodRecommendations: List<String>.from(json['foodRecommendations']),
    );
  }

  // Konversi ke JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'password': password,
      'weight': weight,
      'height': height,
      'workoutIntensity': workoutIntensity,
      'workoutRecommendations': workoutRecommendations,
      'foodRecommendations': foodRecommendations,
    };
  }
}