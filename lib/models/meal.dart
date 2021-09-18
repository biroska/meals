import 'package:flutter/cupertino.dart';
import 'package:meals/models/category.dart';


enum Complexity {
  Simple,
  Medium,
  Difficult
}

enum Cost {
  Cheap,
  Fair,
  Expensive
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final bool isVegan;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegetarian;

  final Cost cost;
  final Complexity complexity;

  final List<String> categories;
  final List<String> steps;
  final List<String> ingredients;

  const Meal(
      {
        required this.id,
        required this.categories,
        required this.title,
        required this.cost,
        required this.complexity,
        required this.imageUrl,
        required this.duration,
        required this.ingredients,
        required this.steps,
        required this.isGlutenFree,
        required this.isVegan,
        required this.isVegetarian,
        required this.isLactoseFree
      });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simples';
      case Complexity.Medium:
        return 'Normal';
      case Complexity.Difficult:
        return 'Difícil';
      default:
        return 'Desconhecida';
    }
  }

  String get costText{
    switch( cost ){
      case Cost.Cheap: return 'Barato';
      case Cost.Fair: return 'Justo';
      case Cost.Expensive: return 'Caro';
      default: return 'Desconhecido';
    }
  }

}


