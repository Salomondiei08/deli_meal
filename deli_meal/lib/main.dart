import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'providers/category_provider.dart';
import 'providers/meal_provider.dart';
import 'helper/routes.dart' as route;
import 'pages/category_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MealProvider(),
        )
      ],
      child: const DeliMealApp(),
    ),
  );
}

class DeliMealApp extends StatelessWidget {
  const DeliMealApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 228, 1),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w100),
              bodyText2: const TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Deli Meal',
      initialRoute: route.tabsScreen,
      routes: route.routeTable,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => const CategoryPage(),
        );
      },
    );
  }
}
