import 'package:flutter/material.dart';
import 'package:flutter_meals_app/data/dummy_data.dart';
import 'package:flutter_meals_app/screens/meals.dart';
import 'package:flutter_meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: 'Some title', meals: []),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick your category')),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context);
              },
            ),
        ],
      ),
    );
  }
}
