import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favourites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {

  const MealDetailsScreen({
    super.key,
    required this.meal,
    });

  final Meal meal;
  
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final favouriteMeals = ref.watch(favouriteMealsProvider);

    final isFavourite = favouriteMeals.contains(meal);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: () { 
              final wasAdded = ref.read(favouriteMealsProvider.notifier).toggleMealFavouriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: 
                Text(wasAdded ? 'Meal favourited' : "Meal removed from Favourites"))
              );
            } , 
          icon: AnimatedSwitcher(  // Implicit Animation
                duration: const Duration(milliseconds: 150),
                child: Icon(
                  isFavourite ? Icons.favorite : Icons.favorite_outline,key: ValueKey(isFavourite),
                ),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: Tween(begin: 0.6, end: 1.0).animate(animation), 
                  child: child
                  );
              },
            ),
          ),
        ],
      ),
      body: 
      SingleChildScrollView(
        child: Column(
          children: [
            // Hero animates the image between two screens
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,),
            ),

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