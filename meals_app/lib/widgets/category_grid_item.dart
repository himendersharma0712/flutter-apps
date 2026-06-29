import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {

  const CategoryGridItem({
    super.key,
    required this.category, 
    required this.onSelectCategory});

  final void Function() onSelectCategory; 
  final Category category;

  @override
  Widget build(BuildContext context) {
    // GestureDetector vs InkWell
    // InkWell provides feedback to the user 
    // GestureDetector does not 
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withValues(alpha: 0.55),
            category.color.withValues(alpha: 0.9)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
          )
        ),
        child: Text(category.title,
        textScaler: TextScaler.linear(0.9),
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.inverseSurface
        ),
        ),
      ),
    );  
  }
}