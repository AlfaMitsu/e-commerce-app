import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/models/product_model.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final List<Product> _cartItems = [];

  CartBloc() : super(CartInitial([])) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<ClearCart>(_onClearCart);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    _cartItems.add(event.product);
    emit(CartUpdated(_cartItems));
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    _cartItems.remove(event.product);
    emit(CartUpdated(_cartItems));
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    _cartItems.clear();
    emit(CartUpdated(_cartItems));
  }
}
