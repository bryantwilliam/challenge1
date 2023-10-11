import 'package:challenge1/models/category.dart';

class GroceryItem {
  final String id;
  final String name;
  final int quantity;
  final Category category;

  const GroceryItem({
    required this.name,
    required this.quantity,
    required this.category,
    required this.id,
  });
}
