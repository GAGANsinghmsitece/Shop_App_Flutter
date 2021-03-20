import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/cart.dart';
import './ui/screens/order_screen.dart';
import './ui/screens/product_detail_screen.dart';
import './ui/screens/products_overview_screen.dart';
import './ui/screens/cart_screen.dart';
import './routes.dart';
import './providers/product.dart';
import './providers/orders.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        title: 'Shop App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductsOverViewScreen(),
        routes: {
          Routes.Product_Detail.route: (ctx) => ProductDetailScreen(),
          Routes.Cart_Screen.route: (ctx) => CartScreen(),
          Routes.Order_Screen.route: (ctx) => OrderScreen()
        },
      ),
    );
  }
}
