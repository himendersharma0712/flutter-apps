import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget{
  const FiltersScreen({super.key});

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        ),
        drawer: MainDrawer(onSelectScreen: ((identifier) {
          Navigator.of(context).pop();
          if(identifier == 'meals'){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => const TabsScreen())
              
              // pushReplacement replaces the screen instead of pushing it onto the stack

              // Navigator.of(context).pushReplacement()
            );
          }
        })),
        body: Column(
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
    );
  }
}