import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favourites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';
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

  
  Map<Filters,bool> _selectedFilters = kIntialFilters;


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
          MaterialPageRoute(builder: (ctx) => FiltersScreen()));

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
      availableMeals: availableMeals,);

    if(_selectedPageIndex == 1){
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
      meals: favouriteMeals, 
     );
      activePageTitle = 'Favourites';
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
          BottomNavigationBarItem(
          icon: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: Icon(Icons.set_meal_outlined, key: Key(_selectedPageIndex.toString()),),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
              scale: Tween(begin: 0.95,end: 1.0).animate(animation),
              child: child,);
            },
            ), 
          label: 'Categories'),
          BottomNavigationBarItem(
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: Icon(Icons.favorite, key: Key(_selectedPageIndex.toString()),),
              transitionBuilder: (child, animation) {
              return ScaleTransition(
              scale: Tween(begin: 0.7,end: 1.0).animate(animation),
              child: child,);
            },
              ), 
            label: 'Favourites')
        ],
        ),
    );
  }

}