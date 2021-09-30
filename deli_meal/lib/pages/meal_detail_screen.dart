import 'package:flutter/material.dart';

import '/models/meal.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({Key? key}) : super(key: key);

  Widget buildContainer(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildList(Widget widget) {
    return Container(
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: widget);
  }

  @override
  Widget build(BuildContext context) {

    void _delete() {
      return Navigator.pop(context, 'Ok');
    }

    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildContainer(context, 'Ingrédients'),
            buildList(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, idx) => Card(
                  color: Colors.amber,
                  child: Text(
                    meal.ingredients[idx],
                  ),
                ),
              ),
            ),
            buildContainer(context, 'Steps'),
            buildList(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, idx) => Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: FittedBox(child: Text('# $idx')),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      meal.steps[idx],
                    ),
                  ),
                  const Divider(),
                ]),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _delete,
        child: const Icon(Icons.delete),
      ),
    );
  }
}
