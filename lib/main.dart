import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        AppRoutes.categoriesMeals: (ctx) => const CategoriesMealsScreen(),
        AppRoutes.mealDetail: (ctx) => const MealDetailScreen(),
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