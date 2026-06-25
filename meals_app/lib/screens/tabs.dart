import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget{

  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }

}

class _TabsScreenState extends State<TabsScreen> {

  int  _selectedPageIndex = 0;

  final List<Meal> _favouriteMeals = [];

  void _toggleMealFavouriteStatus(Meal meal){
    final isExisting = _favouriteMeals.contains(meal);

    if(isExisting){
      Fluttertoast.showToast(msg: 'Meal removed from favourites',toastLength: Toast.LENGTH_SHORT);
      setState(() {
        _favouriteMeals.remove(meal);
      });
    }
    else{
      Fluttertoast.showToast(msg: 'Meal marked as favourite',toastLength: Toast.LENGTH_SHORT);
      setState(() {
         _favouriteMeals.add(meal);
      });
    }
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }


  void _setScreen(String screen){

      Navigator.of(context).pop();

      if(screen == 'filters'){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => FiltersScreen()));
      }
  }

  @override
  Widget build(BuildContext context) {
    var activePageTitle = 'Categories';
    Widget activePage = CategoriesScreen(onToggleFavourite: _toggleMealFavouriteStatus,);

    if(_selectedPageIndex == 1){
      activePage = MealsScreen(meals: _favouriteMeals, 
      onToggleFavourite: _toggleMealFavouriteStatus,);
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        drawer: MainDrawer(onSelectScreen: _setScreen,),
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