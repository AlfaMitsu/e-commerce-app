import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/cart_bloc.dart';
import '../blocs/bloc/cart_event.dart';
import '../blocs/bloc/cart_state.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartUpdated) {
            if (state.cartItems.isEmpty) {
              return const Center(child: Text('Cart is empty'));
            }
            return ListView.builder(
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                final product = state.cartItems[index];
                return ListTile(
                  title: Text(product.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      context.read<CartBloc>().add(RemoveFromCart(product));
                    },
                  ),
                );
              },
            );
          }
          return const Center(child: Text('Cart is empty'));
        },
      ),
    );
  }
}
