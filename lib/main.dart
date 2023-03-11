import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

import 'data/dummy_data.dart';
import 'models/meal.dart';
import 'models/settings.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = dummyMeals;

  void _filterMeals (Settings settings) {
    setState(() {
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        primaryColor: Colors.pink,
        primarySwatch: Colors.pink,
        textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            )),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
      ),
      routes: {
        AppRoutes.home: (ctx) => const TabsScreen(),
        AppRoutes.categoriesMeals: (ctx) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.mealDetail: (ctx) => const MealDetailScreen(),
        AppRoutes.settings: (ctx) => SettingsScreen(_filterMeals),
      },
      // onGenerateRoute: (settings) {
      //   if (settings.name == '/foo') {
      //     return null;
      //   } else if (settings.name == '/baz') {
      //     return null;
      //   } else {
      //     return MaterialPageRoute(builder: (_) {
      //       return const CategoriesScreen();
      //     });
      //   }
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (_) {
      //     return const CategoriesScreen();
      //   });
      // },
    );
  }
}
