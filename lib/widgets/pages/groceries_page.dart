import 'package:challenge1/models/grocery_item.dart';
import 'package:challenge1/widgets/pages/new_item_page.dart';
import 'package:flutter/material.dart';

class GroceriesPage extends StatefulWidget {
  const GroceriesPage({super.key});

  @override
  State<GroceriesPage> createState() => _GroceriesPageState();
}

// TODO: show "you have no items yet"
// TODO: have swipe to delete in list

class _GroceriesPageState extends State<GroceriesPage> {
  final List<GroceryItem> _groceryItems = [];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (BuildContext ctx, int index) {
          return ListTile(
            leading: Container(
              color: _groceryItems[index].category.color,
              width: screenSize.width * 0.06,
              height: screenSize.width * 0.06,
            ),
            title: Text(_groceryItems[index].name),
            trailing: Text(_groceryItems[index].quantity.toString()),
          );
        },
      ),
    );
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItemPage(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }
}
