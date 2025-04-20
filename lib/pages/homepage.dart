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
  List<CityModel> _filteredCities = [];
  @override
  void initState() {
    super.initState();
    _loadCities();
  }

  Future<void> _loadCities() async {
    final List<CityModel> cities = await _cityService.loadCities();
    setState(() {
      _cities = cities;
      _filteredCities = cities;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Local',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5C2EBC),
                  fontFamily: 'Montserrat',
                ),
              ),
              TextSpan(
                text: 'Hop!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF99A3AB),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.deepPurple),
            onPressed: () {
              
            },
          ),
          const SizedBox(
            width: 10,
          ), 
          IconButton(
            icon: const Icon(Icons.search, color: Colors.deepPurple),
            onPressed: () {
             
              showSearch(
                context: context,
                delegate: CitySearchDelegate(
                  _cities,
                ), 
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Recommended for you',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            _buildCityListHorizontal(),
            const SizedBox(height: 20),
            const Text(
              'Recommended places by others',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            _buildCityListHorizontal(),
            const SizedBox(height: 20),
            const Text(
              'Explore Similar Destination',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            _buildCityListHorizontal(),
          ],
        ),
      ),
    );
  }

  Widget _buildCityListHorizontal() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _cities.length,
        itemBuilder: (context, index) {
          final city = _cities[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CityDetailPage(city: city)),
              );
            },
            child: Container(
              width: 160,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(city.image, fit: BoxFit.cover),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.black.withOpacity(0.5),
                        child: Text(
                          city.city,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CitySearchDelegate extends SearchDelegate {
  final List<CityModel> cities;

  CitySearchDelegate(this.cities);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredCities =
        cities.where((city) {
          return city.city.toLowerCase().contains(query.toLowerCase());
        }).toList();

    return ListView.builder(
      itemCount: filteredCities.length,
      itemBuilder: (context, index) {
        final city = filteredCities[index];
        return ListTile(
          title: Text(city.city),
          onTap: () {
            close(context, null);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CityDetailPage(city: city)),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions =
        cities.where((city) {
          return city.city.toLowerCase().contains(query.toLowerCase());
        }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final city = suggestions[index];
        return ListTile(
          title: Text(city.city),
          onTap: () {
            query = city.city;
            showResults(context);
          },
        );
      },
    );
  }
}
