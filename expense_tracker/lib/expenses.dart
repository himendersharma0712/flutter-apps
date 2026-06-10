import 'package:expense_tracker/new_expense.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {

  const Expenses({super.key});


  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }

}

// flutter provides a context property for this class automatically

class _ExpensesState extends State<Expenses>{

void _showAddExpenseOverlay(){
  showModalBottomSheet(context: context , builder: (ctx) =>
    NewExpense()
   );
}


final List<Expense> _registeredExpenses = [
  Expense(
    category: Category.food, 
    amount: 215.2, 
    title: 'Pizza', 
    date: DateTime.now() ),
  Expense(
    category: Category.leisure, 
    amount: 254, 
    title: 'Backrooms', 
    date: DateTime.now() ),
  Expense(
    category: Category.food, 
    amount: 5012, 
    title: 'Subway Burgers', 
    date: DateTime.now() ),
  Expense(
    category: Category.work, 
    amount: 665.2, 
    title: 'flutter course', 
    date: DateTime.now() ),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 210, 152, 220),
        title: Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: _showAddExpenseOverlay, icon: Icon(Icons.add))
        ],
        ),
      body: Column(
        children: [
          Text('The Chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }

}


// PlaceHolder() is a nice placeholder widget 