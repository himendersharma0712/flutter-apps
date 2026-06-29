

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';

class NewItem extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _NewItemState();
  }
}


class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new item'),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text('Name')
                ),
                validator: (value) {
                  return 'ooga booga booga';
                },
              ), // instead of TextField for the form,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: '1',
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: DropdownButtonFormField(
                      items: [
                        for(final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                color:  category.value.color,
                              ),
                              const SizedBox(width: 6,),
                              Text(category.value.title)
                            ],
                          ),)
                      ], 
                      onChanged: (value) {}),
                  )
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {}, 
                  child: Text('Reset')),
                  const SizedBox(width: 15,),
                  CupertinoButton.filled(
                  sizeStyle: CupertinoButtonSize.medium,
                  pressedOpacity: 0.7,
                  onPressed: () {}, 
                  child: Text('Add Item'))
                ],
              )
            ],
          )
          )
        ),
    );
  }
}