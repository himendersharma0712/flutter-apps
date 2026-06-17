

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {

  const ExpensesList({super.key, 
  required this.expenses, 
  required this.removeExpense});

  final void Function(Expense expense) removeExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
       // key is needed to identify the widget which needs to be removed
      itemBuilder: (ctx,index) =>  Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(horizontal: 16)
        ),
        key: ValueKey(expenses[index]) ,
        onDismissed: (direction) {
          removeExpense(expenses[index]);
        } , 
        child:ExpenseItem(expense: expenses[index])));
  }
}

// use listview for dynamic lists that may be very large 