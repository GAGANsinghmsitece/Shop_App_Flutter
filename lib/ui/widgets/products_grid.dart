import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../../providers/product.dart';

class ProductGrid extends StatelessWidget {
  final bool isFavourite;
  ProductGrid(this.isFavourite);
  @override
  Widget build(BuildContext context) {
    final productItems = Provider.of<Products>(context);
    final products = isFavourite ? productItems.productFav : productItems.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        //using  .value function if you're using with a object.
        value: products[index],
        child: ProductItem(),
      ),
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
    );
  }
}
