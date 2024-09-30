import '../../../../home/data/models/product_model.dart';

abstract class CartState {}

class CartInitial extends CartState {
  final List<Product> cartItems;
  CartInitial(this.cartItems);
}

class CartUpdated extends CartState {
  final List<Product> cartItems;
  CartUpdated(this.cartItems);
}
