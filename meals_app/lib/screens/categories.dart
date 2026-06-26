import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {

    const CategoriesScreen({super.key, 
    required this.onToggleFavourite,
    required this.availableMeals});

    final void Function(Meal meal) onToggleFavourite ;
    final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {
    
  // late specifies that it will be initialized later
  late AnimationController _animationController;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,  
      );

      _animationController.forward();
  }
    

    @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
    
    // Navigator class is used to navigate between screens
    void _selectCategory(BuildContext context, Category category){
      final filteredMeals = widget.availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
      
      Navigator.push(context, MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: filteredMeals, 
          title: category.title,
          onToggleFavourite: widget.onToggleFavourite,)));
    }

    @override
    Widget build(BuildContext context){
      return 
        AnimatedBuilder(animation: _animationController, 
        child:GridView(
        padding: EdgeInsets.all(24), 
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, 
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
        ),
        children: 
        availableCategories.map((category) => CategoryGridItem(category: category,
        onSelectCategory: () { _selectCategory(context, category); },)).toList()
        ,),
        builder: (context,child) => SlideTransition(
        position: Tween(
            begin: Offset(0,0.3),
            end: Offset(0, 0)
          ).animate(CurvedAnimation(
            parent: _animationController, 
            curve: Curves.fastOutSlowIn)),
        child: child,
        )

        // Padding(
        //   padding: EdgeInsetsGeometry.only(
        //     // initially the padding is 100 - 0
        //     // but it changes to 100 - 100 = 0 in 300 ms
        //     top: 100 - _animationController.value * 100
        //     ),
        //   child: child,
        // )
        );
    }
}