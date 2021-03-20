import './cartitem.dart';

class OrderItem {
  final String id;
  final List<CartItem> products;
  final double amount;
  final DateTime timeStamp;
  OrderItem({this.id, this.products, this.amount, this.timeStamp});
}
