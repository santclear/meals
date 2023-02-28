import 'package:flutter/foundation.dart';

enum Complexity {
  SIMPLE,
  MEDIUM,
  DIFFICULT,
}

enum Cost {
  CHEAP,
  FAIR,
  EXPENSIVE,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.SIMPLE:
        return 'Simple';
      case Complexity.MEDIUM:
        return 'Normal';
      case Complexity.DIFFICULT:
        return 'Difficult';
      default:
        return 'Unknown';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.CHEAP:
        return 'Cheap';
      case Cost.FAIR:
        return 'Fair';
      case Cost.EXPENSIVE:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }
}
