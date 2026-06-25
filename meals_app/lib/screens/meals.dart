import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget{

  const MealsScreen({super.key, 
  required this.meals, 
  this.title,
  required this.onToggleFavourite});

  final String? title;
  final List<Meal> meals;

  final void Function(Meal meal) onToggleFavourite ;

  void _selectMeal(BuildContext context, Meal meal){
      Navigator.push(context, MaterialPageRoute(builder: (context) => 
      MealDetailsScreen(
        meal: meal,
        onToggleFavourite: onToggleFavourite,)));
  }

  @override
  Widget build(BuildContext context) {

    Widget mealsList = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx,index) =>
      MealItem(meal: meals[index], selectMeal: (meal) {
        _selectMeal(context,meal);
      },)
      );

    if(meals.isEmpty){
        mealsList = Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nothing here...',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              )),
              const SizedBox(height: 16,),
              Text('Try selecting a different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ), )
            ],
          ),
        );
    }

    if(title == null){
      return mealsList;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: mealsList
    );
  }
}