import 'package:expense_tracker/new_expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
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
  showModalBottomSheet(
    useSafeArea: true, // apply some padding to stay away from camera
    isScrollControlled: true,
    context: context , 
    builder: (ctx) => NewExpense(onAddExpense: _addExpense)
   );
}


void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }


void _addExpense(Expense expense){
  setState(() {
    _registeredExpenses.add(expense);
  });
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
    category: Category.work, 
    amount: 665.2, 
    title: 'flutter course', 
    date: DateTime.now() ),
];

  @override
  Widget build(BuildContext context) {

    // Gives the height and width of the device
    final width = MediaQuery.of(context).size.width;
    // MediaQuery.of(context).size.height;

    Widget mainContent = Center(
      child: Text(
        'No expenses found. Start adding some!'
      ),
    );

    if(_registeredExpenses.isNotEmpty){
       mainContent = ExpensesList(expenses: _registeredExpenses, removeExpense: _removeExpense,);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 136, 196, 165),
        title: Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: _showAddExpenseOverlay, icon: Icon(Icons.add))
        ],
        ),
      body: width < 600 ? Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent )
        ],
      ) : Row(
        children: [
          Expanded(child: Chart(expenses: _registeredExpenses)),
          Expanded(child: mainContent )
        ],
      ),
    );
  }

}


// PlaceHolder() is a nice placeholder widget 