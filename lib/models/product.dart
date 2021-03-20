import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavourite = false,
  });

  void toggleFavourite() {
    if (isFavourite == null) {
      isFavourite = false;
    }
    isFavourite = !isFavourite;
    notifyListeners();
  }

  bool returnfav() {
    if (isFavourite == null) {
      return false;
    }
    return isFavourite;
  }
}
