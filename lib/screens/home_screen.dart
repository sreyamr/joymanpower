import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "Hi, Good Morning!",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: _getBodyContent(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 2) {
      Navigator.pushNamed(context, AppRoutes.profile);
    }
  }

  Widget _getBodyContent(int index) {
    switch (index) {
      case 0:
        return const Text(
          'Home Screen',
          style: TextStyle(fontSize: 22),
        );
      case 1:
        return const Text(
          'Wallet Screen',
          style: TextStyle(fontSize: 22),
        );
      case 2:
        return const Text(
          'Profile Screen',
          style: TextStyle(fontSize: 22),
        );
      default:
        return const Text(
          'Home Screen',
          style: TextStyle(fontSize: 22),
        );
    }
  }
}
