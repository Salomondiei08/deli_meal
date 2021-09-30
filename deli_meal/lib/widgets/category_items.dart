import 'package:flutter/material.dart';

import '/helper/routes.dart' as route;

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.title, required this.color, required this.id})
      : super(key: key);
  final String id;
  final String title;
  final Color color;

  void selectCategory(BuildContext ctx) =>
      Navigator.pushNamed(ctx, route.categoryMealPage,
          arguments: {'title': title, 'id': id, 'color' : color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color.withOpacity(0.7), color],
          ),
        ),
      ),
    );
  }
}
