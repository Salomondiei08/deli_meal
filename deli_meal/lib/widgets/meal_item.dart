import 'package:deli_meal/helper/routes.dart' as route;
import 'package:flutter/material.dart';

import '/models/meal.dart';

class MealItem extends StatefulWidget {
  const MealItem({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  bool _isVisible = true;

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(route.mealDetailPage, arguments: widget.meal)
        .then(
      (value) {
        value != null
            ? setState(() {
                _isVisible = false;
              })
            : null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: InkWell(
        onTap: () => selectMeal(context),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(widget.meal.imageUrl,
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 20,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.meal.title,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.schedule),
                            const SizedBox(width: 5),
                            Text('${widget.meal.duration} min'),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.work),
                            const SizedBox(width: 5),
                            Text(widget.meal.complexityText),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.attach_money),
                            const SizedBox(width: 5),
                            Text(widget.meal.affordabilityText),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
