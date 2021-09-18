import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    // extraido para variavel pois as bordas do inkwell devem coincider com as do container
    final _borderRadius = BorderRadius.circular(15);

    // InkWeel recurso de click/tap sobre o container
    return InkWell(
      onTap: () => _selectedCategory(context),
      borderRadius: _borderRadius,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        // Padding interno do Box para o texto nao ficar colado na borda do card
        padding: EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          gradient: LinearGradient(
              colors: [category.color.withOpacity(0.5), category.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
      ),
    );
  }

  // Coloca um componente / pagina CategoriesMeals no topo da pilha de screens
  void _selectedCategory(BuildContext context) {
  // Navegacao via rota nomeada
    Navigator.of(context).pushNamed(
      '/categories-meals',
      arguments: category,
    );
  }
}
