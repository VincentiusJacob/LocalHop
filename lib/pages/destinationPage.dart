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
  List<CityModel> _SearchCities = [];
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _loadCities();
  }

  Future<void> _loadCities() async {
    final List<CityModel> cities = await _cityService.loadCities();
    setState(() {
      _cities = cities;
      _SearchCities = cities;
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _filterTab(0, 'All', Icons.grid_view),
                SizedBox(width: 12),
                _filterTab(1, 'My', Icons.favorite),
                SizedBox(width: 12),
                _filterTab(2, 'Family', Icons.family_restroom),
                SizedBox(width: 12),
                _filterTab(3, 'Nature', Icons.nature_people_rounded),
                SizedBox(width: 12),
                _filterTab(4, 'Kids', Icons.child_friendly),
              ],
            ),
          ),

          // Destination
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: _filteredCities().length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final city = _filteredCities()[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CityDetailPage(city: city),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
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
                                child: Text(
                                  city.city,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
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
            ),
          ),
        ],
      ),
    );
  }

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
              color: isSelected ? Colors.purple : Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  List<CityModel> _filteredCities() {
    if (selectedTab == 0) {
      return _cities;
    }

    switch (selectedTab) {  
      case 1:
        return _cities.where((city) => city.category == 'My').toList();
      case 2:
        return _cities.where((city) => city.category == 'Family').toList();
      case 3:
        return _cities.where((city) => city.category == 'Natureh').toList();
      case 4:
        return _cities.where((city) => city.category == 'Kids').toList();
      default:
        return _cities;
    }
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

