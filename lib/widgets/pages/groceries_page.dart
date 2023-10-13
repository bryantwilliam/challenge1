import 'package:challenge1/models/grocery_item.dart';
import 'package:challenge1/widgets/pages/new_item_page.dart';
import 'package:flutter/material.dart';

class GroceriesPage extends StatefulWidget {
  const GroceriesPage({super.key});

  @override
  State<GroceriesPage> createState() => _GroceriesPageState();
}

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
      body: _groceryItems.isEmpty
          ? const Center(
              child: Text("You haven't added any groceries yet."),
            )
          : ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: (BuildContext ctx, int index) {
                GroceryItem grocery = _groceryItems[index];
                return Dismissible(
                  key: Key(grocery.id),
                  onDismissed: (direction) {
                    _removeItem(index);
                  },
                  child: ListTile(
                    leading: Container(
                      color: grocery.category.color,
                      width: screenSize.width * 0.06,
                      height: screenSize.width * 0.06,
                    ),
                    title: Text(grocery.name),
                    trailing: Text(grocery.quantity.toString()),
                  ),
                );
              },
            ),
    );
  }

  void _removeItem(index) {
    setState(() {
      _groceryItems.removeAt(index);
    });
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
