import 'package:deli_meal/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import 'category_page.dart';
import 'favorite_page.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'page': const CategoryPage(), 'title': 'Category'},
    {'page': const FavoritePage(), 'title': 'Favorite'}
  ];

  int _selectedPgae = 0;

  void _selectPage(int page) {
    setState(() {
      _selectedPgae = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title:  Text(_pages[_selectedPgae]['title']),
      ),
      body: _pages[_selectedPgae]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: _selectPage,
        currentIndex: _selectedPgae,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Star'),
        ],
      ),
    );
  }
}
