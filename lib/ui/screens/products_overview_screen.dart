import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/badge.dart';
import '../widgets/products_grid.dart';
import '../../providers/cart.dart';
import '../../routes.dart';

enum FilterOptions { Favourites, All }

class ProductsOverViewScreen extends StatefulWidget {
  @override
  _ProductsOverViewScreenState createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  bool isFavourite = false;
  int ind = 0;
  List<String> titles = ['My Shop', 'Favourites'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titles[ind]),
          actions: [
            PopupMenuButton(
              onSelected: (FilterOptions selectedvalue) {
                setState(() {
                  if (selectedvalue == FilterOptions.Favourites) {
                    isFavourite = true;
                    ind = 1;
                  } else {
                    isFavourite = false;
                    ind = 0;
                  }
                });
              },
              itemBuilder: (_) => [
                PopupMenuItem(
                    child: Text('Only Favourites'),
                    value: FilterOptions.Favourites),
                PopupMenuItem(child: Text('Show All'), value: FilterOptions.All)
              ],
              icon: Icon(Icons.more_vert),
            ),
            Consumer<Cart>(
              builder: (_, cartData, ch) =>
                  Badge(child: ch, value: cartData.itemCount.toString()),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.Cart_Screen.route);
                },
              ),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: new ProductGrid(isFavourite));
  }
}
