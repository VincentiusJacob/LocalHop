import 'package:flutter/material.dart';
import 'package:flutter_app_demo/model/user_model.dart';
import 'package:flutter_app_demo/pages/destinationPage.dart';
import 'homepage.dart';
import 'profilepage.dart';

class MainPage extends StatefulWidget {
  final UserModel? user;

  const MainPage({Key? key, this.user}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      const HomePage(),
      const DestinationPage(),
      ProfilePage(user: widget.user), 
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.location_city), label: 'Destination'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
