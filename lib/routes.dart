enum Routes { Product_Detail, Cart_Screen, Order_Screen }

extension RoutesExtension on Routes {
  static const route_list = {
    Routes.Product_Detail: '/product_detail',
    Routes.Cart_Screen: '/cart_screen',
    Routes.Order_Screen: '/order_screen',
  };
  String get route => route_list[this];
}
