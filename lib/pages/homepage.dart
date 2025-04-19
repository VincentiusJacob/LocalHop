import 'package:flutter/material.dart';
import 'package:flutter_app_demo/controller/city_service.dart';
import 'package:flutter_app_demo/model/city_model.dart';
import 'package:flutter_app_demo/pages/detailcity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CityService _cityService = CityService(); 
  List<CityModel> _cities = [];

  @override
  void initState() {
    super.initState();
    _loadCities();
  }

  Future<void> _loadCities() async {
    final List<CityModel> cities = await _cityService.loadCities();
    setState(() {
      _cities = cities;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Hop!', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.notifications)),
          IconButton(onPressed: null, icon: Icon(Icons.search)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _filterTab('All'),
              _filterTab('My'),
              _filterTab('Places'),
              _filterTab('Nature'),
              _filterTab('Family'),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Recommended for you', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          ..._cities.take(3).map((city) => _imageCard(context, city)).toList(),
          const SizedBox(height: 20),
          const Text('Recommended places by others', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          ..._cities.take(3).map((city) => _imageCard(context, city)).toList(),
          const SizedBox(height: 20),
          const Text('Explore Similar Destination', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          ..._cities.take(3).map((city) => _imageCard(context, city)).toList(),
        ],
      ),
    );
  }

  Widget _filterTab(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.purple.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(color: Colors.purple)),
    );
  }

  Widget _imageCard(BuildContext context, CityModel city) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (_) => CityDetailPage(city: city),
        ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    city.image,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(city.city, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(city.province, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                      const SizedBox(height: 10),
                      const Text('Places to visit:', style: TextStyle(fontSize: 16)),
                      ...city.places.take(2).map((place) => _placeCard(place)).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _placeCard(PlaceModel place) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Image.asset(place.image, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(place.name),
        subtitle: Text(place.description),
      ),
    );
  }
}
