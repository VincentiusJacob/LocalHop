// import 'dart:ffi';

class PlaceModel {
  final String name;
  final String description;
  final String image;

  PlaceModel({
    required this.name,
    required this.description,
    required this.image,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      name: json['name'] ?? 'Unknown Place',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

class CityModel {
  final String city;
  final String province;
  final String image;
  final String description;
  final int favorite;
  final List<PlaceModel> places;

  CityModel({
    required this.city,
    required this.province,
    required this.image,
    required this.places,
    required this.description,
    required this.favorite
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    var placesJson = json['places'] as List;
    List<PlaceModel> placeList =
        placesJson.map((placeJson) => PlaceModel.fromJson(placeJson)).toList();

    return CityModel(
      city: json['city'],
      province: json['province'],
      image: json['image'],
      description: json['description'],
      favorite: json['favorite'],
      places: placeList,
    );
  }
}
