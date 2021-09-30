import 'package:flutter/material.dart';


import '/helper/type.dart';
import '/widgets/main_drawer.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, VoidArg updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: Text(
                'Adjust your filters',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 500,
            child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten Free',
                    'Only displays Glutten-Free Maels',
                    _isGlutenFree, (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only displays VeganMaels', _isVegan, (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose Free',
                    'Only displays Lactose-Free Maels',
                    _isLactoseFree, (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian',
                    'Only displays Vegetarian Maels',
                    _isVegetarian, (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
