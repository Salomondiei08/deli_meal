import 'package:deli_meal/providers/meal_provider.dart';
import 'package:deli_meal/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorite = Provider.of<MealProvider>(context);

    return favorite.getFavoriteMeals().isEmpty
        ? const Center(
            child: Text('Pas de favoris'),
          )
        : ListView.builder(
            itemBuilder: (ctx, idx) {
              return MealItem(
                meal: favorite.getFavoriteMeals()[idx],
              );
            },
            itemCount: favorite.getFavoriteMeals().length,
          );
  }
}
