import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/product_bloc.dart';
import '../blocs/bloc/product_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return GridView.builder(
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final product = state.products[index];
                return Card(
                  child: Column(
                    children: [
                      Image.network(product.imageUrl,
                          height: 100, fit: BoxFit.cover),
                      Text(product.name),
                      Text('\$${product.price.toStringAsFixed(2)}'),
                    ],
                  ),
                );
              },
            );
          } else if (state is ProductError) {
            return const Center(child: Text('Error loading products'));
          }
          return Container();
        },
      ),
    );
  }
}
