import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreen extends StatefulWidget{

  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }

}

class _TabsScreenState extends State<TabsScreen> {

  int  _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var activePageTitle = 'Categories';
    Widget activePage = const CategoriesScreen();

    if(_selectedPageIndex == 1){
      activePage = MealsScreen(meals: []);
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites')
        ],
        ),
    );
  }

}