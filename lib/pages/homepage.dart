import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

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
          _imageCard(
            'Yogyakarta',
            'Daerah Istimewa Yogyakarta',
            'assets/images/Yogyakarta.jpeg',
          ),
          _imageCard(
            'Yogyakarta',
            'Daerah Istimewa Yogyakarta',
            'assets/images/Yogyakarta.jpeg',
          ),

          SizedBox(height: 20),
          Text('Recommended places by others', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          _imageCard(
            'Yogyakarta',
            'Daerah Istimewa Yogyakarta',
            'assets/images/Yogyakarta.jpeg',
          ),
          _imageCard(
            'Yogyakarta',
            'Daerah Istimewa Yogyakarta',
            'assets/images/Yogyakarta.jpeg',
          ),

          SizedBox(height: 20),
          Text('Explore Similar Destination', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          _imageCard(
            'Yogyakarta',
            'Daerah Istimewa Yogyakarta',
            'assets/images/Yogyakarta.jpeg',
          ),
          _imageCard(
            'Yogyakarta',
            'Daerah Istimewa Yogyakarta',
            'assets/images/Yogyakarta.jpeg',
          ),
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

Widget _imageCard(String title, String subtitle, String imagePath) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8),
    child: Card(
      elevation: 4,
      child: Row(
        children: [
          Image.asset(imagePath, width: 120, height: 120, fit: BoxFit.cover),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 18)),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
