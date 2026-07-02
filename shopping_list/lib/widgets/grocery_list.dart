import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];

  late Future<List<GroceryItem>> _loadedItems;

  @override
  void initState() {
    super.initState();
    _loadedItems = _loadItems();
  }

  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(
      'flutter-demo-2925f-default-rtdb.europe-west1.firebasedatabase.app',
      'shopping_list.json',
    );

    final response = await http.get(url);

    if (response.body == 'null') {
      return [];
    }

    if (response.statusCode >= 400) {
      throw Exception('Failed to fetch grocery items. Try again');
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];

    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
            (catItem) => catItem.value.title == item.value['category'],
          )
          .value;
      loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        ),
      );
    }

    return loadedItems;
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) {
          return NewItem();
        },
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https(
      'flutter-demo-2925f-default-rtdb.europe-west1.firebasedatabase.app',
      'shopping_list/${item.id}.json',
    );

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      // show error message if fails
      _groceryItems.insert(index, item);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(onPressed: _addItem, icon: Icon(CupertinoIcons.add)),
        ],
      ),
      body: FutureBuilder(
        future: _loadedItems,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(
                radius: 20.0,
                color: CupertinoColors.white,
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(snapshot.error.toString()),
            ));
          }

          if (snapshot.data!.isEmpty) {
            return Center(child: Text('No items added yet.'));
          }

          return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            key: ValueKey(snapshot.data![index].id),
            onDismissed: (direction) {
              _removeItem(snapshot.data![index]);
            },
            child: ListTile(
              title: Text(snapshot.data![index].name),
              leading: Container(
                width: 24,
                height: 24,
                color: snapshot.data![index].category.color,
              ),
              trailing: Text(snapshot.data![index].quantity.toString()),
            ),
          );
        },
      );

        }),
      ),
    );
  }
}
