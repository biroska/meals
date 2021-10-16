import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatefulWidget {
  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {

  Settings settings = Settings();

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals( Settings settings ){

    this.settings = settings;

    setState(() {
      _availableMeals = DUMMY_MEALS.where( (meal) {
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        final filterLactoseFree = settings.isLactoseFree && !meal.isLactoseFree;

        return !filterGluten && !filterLactoseFree && !filterVegetarian && !filterVegan;
      }).toList();
    });
  }

  void _toggleFavorite( Meal meal){
    setState(() {
      _favoriteMeals.contains( meal ) ? _favoriteMeals.remove( meal ) : _favoriteMeals.add( meal );
    });
  }

  bool _isFavorite( Meal meal ){
    return _favoriteMeals.contains( meal );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            // accentColor: Colors.amber,
            colorScheme: const ColorScheme.light().copyWith(secondary: Colors.amber),
            canvasColor: const Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6:
                    const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'))),
        routes: {
          AppRoutes.HOME: (context) => TabsScreen( _favoriteMeals ),
          AppRoutes.CATEGORIES_MEALS: (context) => CategoriesMealsScreen( _availableMeals ),
          AppRoutes.MEAL_DETAIL: (context) => MealDetailScreen( _isFavorite, _toggleFavorite ),
          AppRoutes.SETTINGS: (context) => SettingsScreen( settings, _filterMeals ),
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
