import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Padding interno do Box para o texto nao ficar colado na borda do card
      padding: EdgeInsets.all(15),
      child: Text(this.category.title),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
            colors: [this.category.color.withOpacity(0.5), this.category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
    );
  }
}
