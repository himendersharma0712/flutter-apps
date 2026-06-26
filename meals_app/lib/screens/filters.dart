import 'package:flutter/material.dart';


enum Filters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}


class FiltersScreen extends StatefulWidget{
  const FiltersScreen({
    super.key,
    required this.currentFilters
    });

  final Map<Filters,bool> currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}


class _FiltersScreenState extends State<FiltersScreen> {

  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegetarian = false;
  var _isVegan = false;

  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget.currentFilters[Filters.glutenFree]!;
    _isLactoseFree = widget.currentFilters[Filters.lactoseFree]!;
    _isVegan = widget.currentFilters[Filters.vegan]!;
    _isVegetarian = widget.currentFilters[Filters.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        ),
        // drawer: MainDrawer(onSelectScreen: ((identifier) {
        //   Navigator.of(context).pop();
        //   if(identifier == 'meals'){
        //     Navigator.of(context).push(
        //       MaterialPageRoute(builder: (ctx) => const TabsScreen())
              
        //       // pushReplacement replaces the screen instead of pushing it onto the stack

        //       // Navigator.of(context).pushReplacement()
        //     );
        //   }
        // })),
        body: PopScope(
          // Creates a widget that registers a callback to veto attempts 
          // by the user to dismiss the enclosing [ModalRoute]
          canPop: false,
          onPopInvokedWithResult: (bool didPop, dynamic result) {
            if(didPop) return;
            Navigator.of(context).pop({
              Filters.glutenFree: _isGlutenFree,
              Filters.lactoseFree: _isLactoseFree,
              Filters.vegan: _isVegan,
              Filters.vegetarian: _isVegetarian
            });
          },
          child: Column(
            children: [
              SwitchListTile(
                value: _isGlutenFree , 
                onChanged: (isChecked) {
                  setState(() {
                    _isGlutenFree = isChecked;
                  });
                }, 
                title: Text(
                'Gluten-Free'
              , style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),),
              subtitle: Text('Only include gluten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),),
              activeThumbColor:Theme.of(context).colorScheme.tertiary ,
              contentPadding: EdgeInsets.only(left: 34,right: 22),
              ),
              SwitchListTile(
                value: _isLactoseFree , 
                onChanged: (isChecked) {
                  setState(() {
                    _isLactoseFree = isChecked;
                  });
                }, 
                title: Text(
                'Lactose-Free'
              , style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),),
              subtitle: Text('Only include lactose-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),),
              activeThumbColor:Theme.of(context).colorScheme.tertiary ,
              contentPadding: EdgeInsets.only(left: 34,right: 22),
              ),
              SwitchListTile(
                value: _isVegetarian , 
                onChanged: (isChecked) {
                  setState(() {
                    _isVegetarian = isChecked;
                  });
                }, 
                title: Text(
                'Vegetarian'
              , style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),),
              subtitle: Text('Only include vegetarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),),
              activeThumbColor:Theme.of(context).colorScheme.tertiary ,
              contentPadding: EdgeInsets.only(left: 34,right: 22),
              ),
              SwitchListTile(
                value: _isVegan , 
                onChanged: (isChecked) {
                  setState(() {
                    _isVegan = isChecked;
                  });
                }, 
                title: Text(
                'Vegan'
              , style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),),
              subtitle: Text('Only include vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
              ),),
              activeThumbColor:Theme.of(context).colorScheme.tertiary ,
              contentPadding: EdgeInsets.only(left: 34,right: 22),
              )
            ],
          ),
        ),
    );
  }
}