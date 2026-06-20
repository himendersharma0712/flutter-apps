import 'dart:io';

import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // for ios widgets

class NewExpense extends StatefulWidget {
  
  const NewExpense({super.key, required this.onAddExpense});
  
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}


class _NewExpenseState extends State<NewExpense> {

  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue){
  //     _enteredTitle = inputValue;
  // }


  void _datePicker() async{
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month - 1, now.day);
    final pickedDate = await showDatePicker(
    context: context, 
    initialDate: now, 
    firstDate: firstDate,
    lastDate: now );

    // this will be executed after the value is available
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate; 
  Category _selectedCategory = Category.leisure;

  void _showDialog(){
      // Platform object to determine the platform and render accordingly
      if(Platform.isIOS){
      showCupertinoDialog(context: context, builder: (ctx) => CupertinoAlertDialog(
          title: Text('Invalid Input'),
            content: Text('Please input a valid title, amount, date and category.'),
            actions: [
              TextButton(
                onPressed: () { 
                Navigator.pop(ctx); }, 
                child: Text('OK'))
            ],
        ));
      }
      else{
        showDialog(context: context, builder: (ctx) =>
          AlertDialog(
            title: Text('Invalid Input'),
            content: Text('Please input a valid title, amount, date and category.'),
            actions: [
              TextButton(
                onPressed: () { 
                Navigator.pop(ctx); }, 
                child: Text('OK'))
            ],
          )
        );
      }
  }



  void _submitExpenseData(){

      
      final enteredAmount = double.tryParse(_amountController.text);
      final amountIsInvalid = enteredAmount == null || enteredAmount <=0;
      if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null){
        _showDialog();
        return;
      }
      
      widget.onAddExpense(
      Expense(
        category: _selectedCategory,
        amount: enteredAmount,
        title: _titleController.text,
        date: _selectedDate!,
      ),
    );

    Navigator.pop(context);

  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    
    return LayoutBuilder(builder: (context, constraints) {
      
      // print(constraints.minWidth);
      // print(constraints.maxWidth);
      // print(constraints.minHeight);
      // print(constraints.maxHeight);

      final width = constraints.maxWidth;
      return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16,48,16,keyboardSpace + 16),
          child: Column(
            children: [
            if(width >= 600)  // dynamic rendering
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Expanded(
                  child: TextField(
                  // onChanged: _saveTitleInput ,
                  controller: _titleController,
                  maxLength: 50,
                  maxLines: 1,
                  decoration: InputDecoration(
                    label: Text('Title')
                  ),
                                ),
                ),
              const SizedBox(width: 24,),
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount')
                  ),
                ),
              ),

              ],)
            else 
              TextField(
                // onChanged: _saveTitleInput ,
                controller: _titleController,
                maxLength: 50,
                maxLines: 1,
                decoration: InputDecoration(
                  label: Text('Title')
                ),
              ),
            
            // the if else statements above dictate only the rendering
            // between TextField and whatever is below the if and before else
              
              if(width >= 600)
                Row(
                  children: [
                    DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toUpperCase())) ).toList(),
                   onChanged: (value) {
                    setState(() {
                      if(value == null){
                        return;
                      }
                      _selectedCategory = value;
                    });
                   },
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selectedDate == null
                                    ? 'Selected Date'
                                    : formatter.format(_selectedDate!),
                              ),
                              IconButton(
                                onPressed: _datePicker,
                                icon: Icon(Icons.calendar_month),
                              ),
                            ],
                          ),
                        )
                  ],
                )
              else
                Row(children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount')
                  ),
                ),
              ),
              const SizedBox(width:16),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null? 'Selected Date': formatter.format(_selectedDate!) ),
                  IconButton(onPressed:_datePicker, 
                  icon: Icon(Icons.calendar_month))
                ],))
              ],),
              const SizedBox(height: 10,),
              if(width >= 600)
                Row(children: [
                  const Spacer(),
                TextButton(onPressed: () {
                  Navigator.pop(context);
                 }, child: Text('Cancel')),
                SizedBox(width: 5,),
                ElevatedButton(onPressed: _submitExpenseData, child: Text('Save Expense')),
                ],)
              else 
              Row(children: [
                DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toUpperCase())) ).toList(),
                   onChanged: (value) {
                    setState(() {
                      if(value == null){
                        return;
                      }
                      _selectedCategory = value;
                    });
                   }),
                   const Spacer(),
                TextButton(onPressed: () {
                  Navigator.pop(context);
                 }, child: Text('Cancel')),
                SizedBox(width: 5,),
                ElevatedButton(onPressed: _submitExpenseData, child: Text('Save Expense')),
              ],)
            ],
          ) ,
        ),
      ),
    );
    },);
    
  }
}