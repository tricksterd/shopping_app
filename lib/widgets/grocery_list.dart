import 'package:flutter/material.dart';

import 'package:shopping_app/data/dummy_items.dart';
import 'package:shopping_app/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({
    super.key,
  });

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addItem() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NewItem()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(onPressed: _addItem, icon: const Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
            itemCount: groceryItems.length,
            itemBuilder: (BuildContext context, int index) {
              final currentItem = groceryItems[index];
              return ListTile(
                leading: Container(
                  color: currentItem.category.color,
                  height: 24,
                  width: 24,
                ),
                title: Text(currentItem.name),
                trailing: Text(
                  currentItem.quantity.toString(),
                  style: const TextStyle(fontSize: 14),
                ),
              );
            }));
  }
}
