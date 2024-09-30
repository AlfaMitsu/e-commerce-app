import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product_model.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FirebaseFirestore _firestore;

  ProductBloc(this._firestore) : super(ProductLoading()) {
    on<LoadProducts>(_onLoadProducts);
    on<SearchProducts>(_onSearchProducts);
  }

  void _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    try {
      final productsSnapshot = await _firestore.collection('products').get();
      final products = productsSnapshot.docs
          .map((doc) => Product.fromFirestore(doc))
          .toList();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  void _onSearchProducts(
      SearchProducts event, Emitter<ProductState> emit) async {
    try {
      final productsSnapshot = await _firestore
          .collection('products')
          .where('name', isGreaterThanOrEqualTo: event.query)
          .where('name', isLessThanOrEqualTo: '${event.query}\uf8ff')
          .get();
      final products = productsSnapshot.docs
          .map((doc) => Product.fromFirestore(doc))
          .toList();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
