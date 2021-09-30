import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/category_provider.dart';
import 'category_items.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Consumer<CategoryProvider>(
        builder: (concontextext, item, child) {
          return GridView.builder(
            itemCount: item.allCategories.length,
            itemBuilder: (context, index) {
              return CategoryItem(
                title: item.allCategories[index].title,
                color: item.allCategories[index].color,
                id: item.allCategories[index].id,
              );
            },
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 20,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
            ),
          );
        },
      ),
    );
  }
}
