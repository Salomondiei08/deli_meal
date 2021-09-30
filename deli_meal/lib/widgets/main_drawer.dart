import 'package:deli_meal/helper/routes.dart' as route;
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, VoidCallback ontap) {
    return ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(fontFamily: 'RobotoCondensed'),
        ),
        onTap: ontap);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.amber,
            child: Center(
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          buildListTile('Meal', Icons.restaurant, () => Navigator.pushReplacementNamed(context, route.tabsScreen)),
          const SizedBox(
            height: 5,
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () => Navigator.pushReplacementNamed(context, route.filterPage),
          )
        ],
      ),
    );
  }
}
