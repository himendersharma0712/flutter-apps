import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/meal_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';

import 'package:meals_app/widgets/main_drawer.dart';

// conventionally global flutter variables are prefixed with k
const kIntialFilters = {
    Filters.glutenFree: false,
    Filters.lactoseFree: false,
    Filters.vegan: false,
    Filters.vegetarian:false
  };

// A [StatefulWidget] that has a [State] capable of reading providers.
class TabsScreen extends ConsumerStatefulWidget{

  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }

}

class _TabsScreenState extends ConsumerState<TabsScreen> {

  int  _selectedPageIndex = 0;

  final List<Meal> _favouriteMeals = [];
  Map<Filters,bool> _selectedFilters = kIntialFilters;

  void _toggleMealFavouriteStatus(Meal meal){
    final isExisting = _favouriteMeals.contains(meal);

    if(isExisting){
      // Fluttertoast.showToast(msg: 'Meal removed from favourites',toastLength: Toast.LENGTH_SHORT);
      setState(() {
        _favouriteMeals.remove(meal);
      });
    }
    else{
      // Fluttertoast.showToast(msg: 'Meal marked as favourite',toastLength: Toast.LENGTH_SHORT);
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


  void _setScreen(String screen) async {

      Navigator.of(context).pop();

      if(screen == 'filters'){
        // we will push the new screen but the result will wait for some paramaters that the RHS would return 
        final result = await Navigator.of(context).push<Map<Filters,bool>>(
          MaterialPageRoute(builder: (ctx) => FiltersScreen(currentFilters: _selectedFilters,)));

      setState(() {
        _selectedFilters = result ?? kIntialFilters;
      });
        
      }
  }

  @override
  Widget build(BuildContext context) {
    
    final meals = ref.watch(mealsProvider);

    final availableMeals = meals.where((meal) {
      if(_selectedFilters[Filters.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(_selectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(_selectedFilters[Filters.vegan]! && !meal.isVegan){
        return false;
      }
      if(_selectedFilters[Filters.vegetarian]! && !meal.isVegetarian){
        return false;
      }
        return true;
      }).toList();


    var activePageTitle = 'Categories';
    Widget activePage = CategoriesScreen(
      onToggleFavourite: _toggleMealFavouriteStatus,
      availableMeals: availableMeals,);

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