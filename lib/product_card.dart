import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String productImage;
  final bool isAdded;
  final VoidCallback addToCart;

  ProductCard({
    required this.productName,
    required this.productImage,
    required this.isAdded,
    required this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(productImage),
          Text(productName),
          ElevatedButton(
            onPressed: isAdded ? null : addToCart,
            child: Text(isAdded ? 'Added' : 'Add to Cart'),
          ),
        ],
      ),
    );
  }
}