import 'package:flutter_riverpod/legacy.dart';
import 'package:meals_app/models/meal.dart';

// basic Provider works for basic dummy data
// use statenotifierprovider for data that can change

// riverpod doesnt allow manipulating objects in memory
// instead you must make new ones

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {

  FavouriteMealsNotifier(): super([]);

  bool toggleMealFavouriteStatus(Meal meal){
    final mealIsFavourite = state.contains(meal);
    
    if(mealIsFavourite){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
    else{
      state = [...state,meal];
      return true;
    }
  }
}

final favouriteMealsProvider = StateNotifierProvider<FavouriteMealsNotifier,List<Meal>>((ref) {
  return FavouriteMealsNotifier();
});