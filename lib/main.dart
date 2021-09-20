import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            // accentColor: Colors.amber,
            colorScheme: ColorScheme.light().copyWith(secondary: Colors.amber),
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6:
                    const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'))),
        routes: {
          AppRoutes.HOME: (context) => CategoriesScreen(),
          AppRoutes.CATEGORIES_MEALS: (context) => CategoriesMealsScreen(),
          AppRoutes.MEAL_DETAIL: (context) => MealDetailScreen(),
        },
        // onGenerateRoute: (settings) {
        //   if ( settings.name == '/alguma-coisa' ){
        //     return null;
        //   } else if ( settings.name == '/outra-coisa' ){
        //     return null;
        //   } else {
        //     return MaterialPageRoute(builder: (_){
        //       return CategoriesScreen();
        //     });
        //   }
        // },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (_){
          return CategoriesScreen();
        });
      },

        );
  }
}
