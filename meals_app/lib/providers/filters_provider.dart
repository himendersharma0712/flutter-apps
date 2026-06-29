import 'package:flutter_riverpod/legacy.dart';


enum Filters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filters,bool>> {

    FiltersNotifier(): super({
      Filters.glutenFree: false,
      Filters.lactoseFree: false,
      Filters.vegan: false,
      Filters.vegetarian:false
    });

    void setFilter(Filters filter, bool isActive){
        state = {
          ...state,
          filter:isActive // copies exisiting state map in this new state var
        };
    }
}




final filtersProvider = StateNotifierProvider<FiltersNotifier,Map<Filters,bool>> ((ref) => FiltersNotifier());