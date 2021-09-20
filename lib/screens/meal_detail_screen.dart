import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings?.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            // padding: const EdgeInsets.all( 10 ),
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric( vertical: 10 ),
            child: Text('Ingredientes', style: Theme.of(context).textTheme.headline6),
          ),
          Container(
            width: 300,
            height: 230,
            padding: EdgeInsets.all( 10 ),
            margin: EdgeInsets.all( 10 ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all( color: Colors.grey),
              borderRadius: BorderRadius.circular( 10 )
            ),
            child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: ( context, item ) {
              return Card(
                child: Padding(
                    padding: const EdgeInsets.symmetric( vertical: 5, horizontal: 10 ),
                    child: Text( meal.ingredients[item] )),
                color: Theme.of(context).accentColor ,
              );
            }),
          ),
        ],
      ),
    );
  }
}
