import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image Gallery
              productImageGallery(product.images),
              const SizedBox(height: 16),

              // Product Name
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 8),

              // Product Price
              Row(
                children: [
                  if (product.discountPrice != null) ...[
                    Text(
                      '\$${product.discountPrice}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '\$${product.originalPrice}',
                      style: const TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                  ] else
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),

              // Product Ratings and Reviews
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  Text('${product.rating}/5 (${product.reviews} reviews)'),
                ],
              ),
              const SizedBox(height: 16),

              // Product Description
              const Text(
                'Description:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(product.description),
              const SizedBox(height: 16),

              // Sizes or Variants
              if (product.sizes != null) sizeSelector(product.sizes!),

              const SizedBox(height: 16),

              // Stock Availability
              Text(
                product.stock > 0
                    ? 'In Stock (${product.stock} left)'
                    : 'Out of Stock',
                style: TextStyle(
                  color: product.stock > 0 ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Add to Cart and Buy Now Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add to cart functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: const Text('Add to Cart'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Buy now functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text('Buy Now'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Delivery Information
              const Text(
                'Delivered in 3-5 business days',
                style: TextStyle(color: Colors.blueGrey),
              ),

              const SizedBox(height: 16),

              // Product Specifications (Technical Details)
              const Text(
                'Specifications:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(product.specifications),

              const SizedBox(height: 16),

              // Related/Recommended Products
              if (product.relatedProducts != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Related Products:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    relatedProductsSection(product.relatedProducts!),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Product Image Gallery
  Widget productImageGallery(List<String>? images) {
    if (images == null || images.isEmpty) {
      return Container(
        height: 200,
        color: Colors.grey.shade200,
        child: const Center(
          child: Text('No Images Available'),
        ),
      );
    }

    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.network(
            images[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  // Size Selector
  Widget sizeSelector(List<String> sizes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Available Sizes:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 10.0,
          children: sizes.map((size) {
            return Chip(
              label: Text(size),
              backgroundColor: Colors.deepPurple.shade100,
            );
          }).toList(),
        ),
      ],
    );
  }

  // Related Products Section
  Widget relatedProductsSection(List<String> relatedProducts) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: relatedProducts.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(relatedProducts[index]),
            ),
          );
        },
      ),
    );
  }
}
