import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {

  @override
  State<TabsScreen> createState() => _TabsScreenState();

}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedScreenIndex = 0;
  final List<Widget> _screens = [ CategoriesScreen(), FavoriteScreen() ];

  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  _selectScreen( int index ){
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedScreenIndex]),
      ),
      body: _screens[ _selectedScreenIndex ],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        // type: BottomNavigationBarType.shifting,
        items: const [
         BottomNavigationBarItem(icon: Icon( Icons.category ),
                                  label: 'Categorias'),
          BottomNavigationBarItem(icon: Icon( Icons.star ),
                                  label: 'Favoritos')
        ],
      ),
    );
  }
}
