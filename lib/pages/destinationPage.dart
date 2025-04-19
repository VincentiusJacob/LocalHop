import 'package:flutter/material.dart';
import 'package:flutter_app_demo/controller/city_service.dart';
import 'package:flutter_app_demo/model/city_model.dart';
import 'package:flutter_app_demo/pages/detailcity.dart';

class DestinationPage extends StatefulWidget {
  const DestinationPage({super.key});

  @override
  State<StatefulWidget> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
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
              _filterTab(0, 'All', Icons.grid_view),
              _filterTab(1, 'My', Icons.favorite),
              _filterTab(2, 'Places', Icons.place),
              _filterTab(3, 'Nature', Icons.nature_people_rounded),
              _filterTab(4, 'Family', Icons.family_restroom),
            ],
          ),
          SizedBox(height: 20),
          Text('Recommended for you', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          ..._cities.map((city) => _imageCard(context, city)).toList(),

          SizedBox(height: 20),
          Text('Recommended places by others', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          ..._cities.map((city) => _imageCard(context, city)).toList(),

          SizedBox(height: 20),
          Text('Explore Similar Destination', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          ..._cities.map((city) => _imageCard(context, city)).toList(),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.location_city_outlined),
      //       label: 'Destination',
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
      //   ],
      // ),
    );
  }

  int selectedTab = 0;

  Widget _filterTab(int index, String label, IconData icon) {
    bool isSelected = selectedTab == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: isSelected ? Colors.purple : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: isSelected ? Colors.white : Colors.purple),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _imageCard(BuildContext context, CityModel city) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => CityDetailPage(city: city)),
      );
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  city.image,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      city.city,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),

                    Text(
                      city.province,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 10),

                    Text(
                      'Places to visit:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

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
      leading: Image.asset(
        place.image,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(place.name),
      subtitle: Text(place.description),
    ),
  );
}
