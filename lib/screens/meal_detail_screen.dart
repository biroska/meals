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
      body: SingleChildScrollView(
        child: Column(
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
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (context, item) {
                    return Card(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(meal.ingredients[item])),
                      color: Theme.of(context).accentColor,
                    );
                  }),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, item) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${item + 1}'),
                        ),
                        title: Text( meal.steps[item] ),
                      ),
                      const Divider(),
                    ],
                  );
                })),
          ],
        ),
      ),
    );
  }

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
        width: 330,
        height: 230,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: child);
  }
}
