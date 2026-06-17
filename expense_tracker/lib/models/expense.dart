
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category {
  food, travel, leisure, work
}

const categoryIcons = {
  Category.food : Icons.lunch_dining_sharp,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expense {


  final String title;
  final double amount;
  final String id;
  final DateTime date; 
  final Category category;
  
  Expense({required this.category, required this.amount, required this.title, required this.date}) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket{

  // alternative constructor function
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category): 
  expenses = allExpenses.where((expense) => expense.category == category).toList() ;

  const ExpenseBucket({
    required this.category,
    required this.expenses
  });

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses{
    double sum = 0;

    for (final expense in expenses){
      sum += expense.amount;
    }
    return sum; 
  }

}