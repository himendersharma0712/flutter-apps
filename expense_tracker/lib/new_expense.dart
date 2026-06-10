
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  
  const NewExpense({super.key});
  
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


  void _datePicker(){
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month - 1, now.day);
    showDatePicker(
    context: context, 
    initialDate: now, 
    firstDate: firstDate,
    lastDate: now );
  }

  final _titleController = TextEditingController();
   final _amountController = TextEditingController();


  

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            // onChanged: _saveTitleInput ,
            controller: _titleController,
            maxLength: 50,
            maxLines: 1,
            decoration: InputDecoration(
              label: Text('Title')
            ),
          ),

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
              Text('Selected Date'),
              IconButton(onPressed:_datePicker, 
              icon: Icon(Icons.calendar_month))
            ],))
          ],),
          SizedBox(height: 10,),
          Row(children: [
            TextButton(onPressed: () {
              Navigator.pop(context);
             }, child: Text('Cancel')),
            SizedBox(width: 5,),
            ElevatedButton(onPressed: () { }, child: Text('Save Expense')),
          ],)
        ],
      ) ,
    );
  }
}