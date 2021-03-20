import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes.dart';
import '../../models/product.dart';
import '../../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedProduct = Provider.of<Product>(context, listen: false);
    final selectedCart = Provider.of<Cart>(context, listen: false);
    print(selectedProduct.returnfav());
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.Product_Detail.route,
                  arguments: selectedProduct.id);
            },
            child: Image.network(selectedProduct.imageUrl, fit: BoxFit.cover)),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            selectedProduct.title,
            textAlign: TextAlign.center,
          ),
          leading: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
              //child is used for widgets which are not going to change
              icon: Icon(
                  product.returnfav() ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.toggleFavourite();
              },
              color: Theme.of(context).accentColor,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              selectedCart.addItems(selectedProduct.id, selectedProduct.price,
                  selectedProduct.title);
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
