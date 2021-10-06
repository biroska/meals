import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {

  // Recebendo uma funcao como parametro ><
  Widget _createItem(IconData icon, String label, Function() onTap ){

    return ListTile(
      leading: Icon(
        icon, size: 26,
      ),
      title: Text( label,
      style: const TextStyle(
        fontFamily: 'RobotoCondensed',
        fontSize: 24,
        fontWeight: FontWeight.bold
      ),),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
          children:<Widget>[
            Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all( 20 ),
              alignment: Alignment.bottomRight,
              color: Theme.of(context).colorScheme.secondary,
              child: Text('Vamos cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor
              ),),
            ),
            const SizedBox(height: 20,),
            // Navigator.of(context).pushReplacementNamed evita que a mesma screen seja incluida repetidamente; na pilha
            _createItem( Icons.restaurant, 'Refeições', () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)  ),
            _createItem( Icons.settings, 'configurações', () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS) )
          ]
      ),
    );
  }
}
