import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '/providers/meal_provider.dart';
import '/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final String categoryTitle = routeArg['title']! as String;
    final String categoryid = routeArg['id']! as String;
    final Color categorycolor = routeArg['color']! as Color;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: categorycolor,
        title: Text(categoryTitle),
      ),
      body: Consumer<MealProvider>(builder: (context, meal, child) {
        return ListView.builder(
          itemBuilder: (ctx, idx) {
            return MealItem(
              meal: meal.getspecificMeals(categoryid)[idx],
            );
          },
          itemCount: meal.getspecificMeals(categoryid).length,
        );
      }),
    );
  }
}
