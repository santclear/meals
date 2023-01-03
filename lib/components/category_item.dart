import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {super.key});

  void _selecteCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoriesMealsScreen(category);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selecteCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [category.color.withOpacity(0.5), category.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
