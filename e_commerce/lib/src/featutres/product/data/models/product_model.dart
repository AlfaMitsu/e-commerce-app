class ProductModel {
  final String name;
  final double price;
  final double? discountPrice;
  final double? originalPrice;
  final double rating;
  final int reviews;
  final String description;
  final List<String>? sizes;
  final List<String>? images;
  final int stock;
  final String specifications;
  final List<String>? relatedProducts;

  ProductModel({
    required this.name,
    required this.price,
    this.discountPrice,
    this.originalPrice,
    required this.rating,
    required this.reviews,
    required this.description,
    this.sizes,
    this.images,
    required this.stock,
    required this.specifications,
    this.relatedProducts,
  });

  // You can add helper methods to parse from a Map or JSON if needed
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'],
      price: map['price'],
      discountPrice: map['discountPrice'],
      originalPrice: map['originalPrice'],
      rating: map['rating'],
      reviews: map['reviews'],
      description: map['description'],
      sizes: map['sizes'] != null ? List<String>.from(map['sizes']) : null,
      images: map['images'] != null ? List<String>.from(map['images']) : null,
      stock: map['stock'],
      specifications: map['specifications'],
      relatedProducts: map['relatedProducts'] != null
          ? List<String>.from(map['relatedProducts'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'discountPrice': discountPrice,
      'originalPrice': originalPrice,
      'rating': rating,
      'reviews': reviews,
      'description': description,
      'sizes': sizes,
      'images': images,
      'stock': stock,
      'specifications': specifications,
      'relatedProducts': relatedProducts,
    };
  }
}

List<ProductModel> products = [
  ProductModel(
    name: 'Smartphone XYZ',
    price: 999.99,
    discountPrice: 899.99,
    originalPrice: 999.99,
    rating: 4.5,
    reviews: 120,
    description: 'A high-quality smartphone with advanced features.',
    sizes: ['64GB', '128GB'],
    images: [
      'https://example.com/image1.jpg',
      'https://example.com/image2.jpg',
    ],
    stock: 10,
    specifications: '6.5-inch display, 12GB RAM, 5000mAh battery',
    relatedProducts: ['Smartphone ABC', 'Smartphone DEF'],
  ),
  ProductModel(
    name: 'Laptop Pro 15',
    price: 1599.99,
    discountPrice: 1499.99,
    originalPrice: 1599.99,
    rating: 4.7,
    reviews: 95,
    description: 'A powerful laptop with an ultra-fast processor.',
    sizes: ['256GB SSD', '512GB SSD'],
    images: [
      'https://example.com/laptop1.jpg',
      'https://example.com/laptop2.jpg',
    ],
    stock: 5,
    specifications: '15-inch display, Intel i7, 16GB RAM, 1TB SSD',
    relatedProducts: ['Laptop Slim 14', 'Laptop Xtreme 17'],
  ),
  ProductModel(
    name: 'Wireless Earbuds',
    price: 199.99,
    discountPrice: 149.99,
    originalPrice: 199.99,
    rating: 4.3,
    reviews: 220,
    description: 'High-quality wireless earbuds with noise cancellation.',
    sizes: null,
    images: [
      'https://example.com/earbuds1.jpg',
      'https://example.com/earbuds2.jpg',
    ],
    stock: 50,
    specifications: 'Bluetooth 5.0, 24-hour battery life, waterproof',
    relatedProducts: ['Over-Ear Headphones', 'Bluetooth Speaker'],
  ),
  ProductModel(
    name: 'Smartwatch Series 5',
    price: 399.99,
    discountPrice: 349.99,
    originalPrice: 399.99,
    rating: 4.6,
    reviews: 180,
    description: 'A modern smartwatch with health and fitness tracking.',
    sizes: ['40mm', '44mm'],
    images: [
      'https://example.com/watch1.jpg',
      'https://example.com/watch2.jpg',
    ],
    stock: 20,
    specifications: 'Heart rate monitor, GPS, 2-day battery life',
    relatedProducts: ['Smartwatch Series 4', 'Fitness Tracker Pro'],
  ),
  ProductModel(
    name: '4K Ultra HD TV',
    price: 1199.99,
    discountPrice: null,
    originalPrice: null,
    rating: 4.8,
    reviews: 340,
    description: 'A 65-inch 4K Ultra HD TV with stunning visuals.',
    sizes: ['55-inch', '65-inch', '75-inch'],
    images: [
      'https://example.com/tv1.jpg',
      'https://example.com/tv2.jpg',
    ],
    stock: 8,
    specifications: '4K Ultra HD, HDR10, Dolby Atmos',
    relatedProducts: ['Soundbar X', 'TV Wall Mount'],
  ),
];
