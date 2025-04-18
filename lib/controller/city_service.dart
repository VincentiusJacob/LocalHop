import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/city_model.dart'; 


class CityService {
  Future<List<CityModel>> loadCities() async {
    final String response = await rootBundle.loadString('lib/data/dummy_place.json');
    final List<dynamic> data = json.decode(response);
    List<CityModel> cities = data.map((jsonCity) => CityModel.fromJson(jsonCity)).toList();
    return cities;
  }
}
