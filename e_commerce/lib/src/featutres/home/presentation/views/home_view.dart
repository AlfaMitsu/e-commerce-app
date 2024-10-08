import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/home_bloc.dart';
import '../blocs/bloc/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Commerce App'),
        backgroundColor: Colors.deepPurple, // Livelier color for the app bar
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeError) {
            return const Center(child: Text('Error loading data'));
          } else if (state is HomeLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for products...',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.deepPurple.shade50, // Soft background color
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  // Categories Section
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple, // Category heading color
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.categories
                          .map((category) => categoryCard(category))
                          .toList(),
                    ),
                  ),

                  // Product Grid
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'Featured Products',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple, // Product heading color
                      ),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemBuilder: (context, index) {
                      return productCard(state.products[index]);
                    },
                  ),
                ],
              ),
            );
          } else {
            return Container(); // Fallback UI
          }
        },
      ),
    );
  }

  // Category Card Widget
  Widget categoryCard(String categoryName) {
    return Card(
      color: Colors.deepPurple.shade100, // Background color for category cards
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Center(
          child: Text(
            categoryName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple, // Text color in category cards
            ),
          ),
        ),
      ),
    );
  }

  // Product Card Widget
  Widget productCard(Map<String, String> product) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
              image: DecorationImage(
                image: AssetImage(
                  product['image']!,
                ), // Replace with network image if needed
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple, // Product name color
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product['price']!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54, // Price text color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
