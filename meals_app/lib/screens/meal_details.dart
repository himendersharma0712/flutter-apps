import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {

  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavourite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavourite ;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: () { onToggleFavourite(meal); } , icon: Icon(Icons.favorite_outline))
        ],
      ),
      body: 
      SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,),
              const SizedBox(height: 14,),
              const Text('Ingredients',
              style: TextStyle(color: Color.fromARGB(255, 223, 96, 96), fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 14,),
              for(final ingredient in meal.ingredients)
                Text(ingredient, style: TextStyle(color: Colors.white)),
              const SizedBox(height: 24,),
              const Text('Instructions',
              style: TextStyle(color: Color.fromARGB(255, 223, 96, 96), fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 14,),
              for(final step in meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:12, vertical: 8),
                  child: Text(step, 
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white)),
                ),       
          ],
        ),
      ),
    );
  }
}