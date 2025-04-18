import 'package:flutter/material.dart';
import 'package:flutter_app_demo/controller/city_service.dart';
import 'package:flutter_app_demo/model/city_model.dart';

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
        title: Text('Local Hop!'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          // Filter
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
          SizedBox(height: 20),
          Text('Recommended for you', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          ..._cities.map((city) => _imageCard(city)).toList(),
          
          SizedBox(height: 20),
          Text('Recommended places by others', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          ..._cities.map((city) => _imageCard(city)).toList(),
          

          SizedBox(height: 20),
          Text('Explore Similar Destination', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          ..._cities.map((city) => _imageCard(city)).toList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city_outlined),
            label: 'Destination'
          ),  
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile'
          ) 
        ],
      ),
    );
  }

}

Widget _filterTab(String label) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.purple.shade100,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(label, style: TextStyle(color: Colors.purple)),
  );
}

Widget _imageCard(CityModel city) {
  return GestureDetector(
    onTap: () {
      // Navigasi ke halaman detail bisa ditambahkan di sini
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 8),
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
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(city.city, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(
                      city.province,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Text('Places to visit:', style: TextStyle(fontSize: 16)),
                    ...city.places.map((place) => _placeCard(place)).toList(),
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
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Image.asset(place.image, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(place.name),
        subtitle: Text(place.description),
      ),
    );
  }
