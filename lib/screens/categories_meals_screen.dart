import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Receitas'),
      ),
      body: Center(
        child: const Text('Receitas por categoria'),
      ),
    );
  }
}
