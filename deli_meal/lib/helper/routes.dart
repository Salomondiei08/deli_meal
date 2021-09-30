import 'package:deli_meal/pages/filters_page.dart';
import 'package:deli_meal/pages/tab_screen.dart';
import 'package:flutter/material.dart';

import '/pages/category_meals_screen.dart';
import '/pages/category_page.dart';
import '/pages/meal_detail_screen.dart';

const String categoryPage = '/category_page';
const String categoryMealPage = '/category_meal_page';
const String mealDetailPage = '/meal_detail_page';
const String tabsScreen = '/';
const String filterPage = '/filter_page';

Map<String, Widget Function(BuildContext)> routeTable = {
  categoryPage: (context) => const CategoryPage(),
  categoryMealPage: (context) => const CategoryMealScreen(),
  mealDetailPage: (context) => const MealDetailPage(),
  tabsScreen: (context) => const TabsScreen(),
  filterPage: (context) => const FilterPage(),
};


