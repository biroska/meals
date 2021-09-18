import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // accentColor: Colors.amber,
        colorScheme: ColorScheme.light().copyWith( secondary: Colors.amber ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontSize:  20,
            fontFamily: 'RobotoCondensed'
          )
        )
      ),
      home: CategoriesScreen(),
      routes: {
        // Definicao da rota nomeada
        '/categories-meals': ( context ) => CategoriesMealsScreen() ,
      },
    );
  }
}