import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'app_state.dart';
import 'cart_page.dart';
import 'product_card.dart';
import 'product_detail_page.dart';
import 'cart_actions.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Moisturizer',
      'image': 'assets/images/moist.png',
      'brand': 'Glad2Glow',
      'weight': '30g',
      'description':
          'Pelembab wajah yang berfungsi untuk mencerahkan kulit wajah dengan kandungan 5% Niacinamide dan ekstrak Pomegranate dengan tekstur gel ringan yang mudah menyerap. Pemakaian rutin dengan Pomegranate 10% Niacinamide Power Bright Serum dapat membuat kulit wajah tampak lebih cerah.'
    },
    {
      'name': 'Serum',
      'image': 'assets/images/serum.png',
      'brand': 'Glad2Glow',
      'weight': '30g',
      'description':
          'Serum dengan kandungan Peach dan Retinol, dengan formula yang gentle namun bermanfaat untuk kulit berjerawat serta menghaluskan kulit wajah. Retinol untuk membantu kulit tampak lebih halus, serta Madecassoside, Ekstrak buah Peach serta Betaine untuk merawat jerawat dan kemerahan.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping'),
        actions: [
          StoreConnector<AppState, int>(
            converter: (store) => store.state.cartItems.length,
            builder: (context, cartItemCount) {
              return Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                  ),
                  if (cartItemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          cartItemCount.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      product: products[index]['name']!,
                      image: products[index]['image']!,
                      brand: products[index]['brand']!,
                      weight: products[index]['weight']!,
                      description: products[index]['description']!,
                    ),
                  ),
                );
              },
              child: StoreConnector<AppState, bool>(
                converter: (store) => store.state.cartItems.any(
                  (item) => item.productName == products[index]['name']!,
                ),
                builder: (context, isAdded) {
                  return ProductCard(
                    productName: products[index]['name']!,
                    productImage: products[index]['image']!,
                    isAdded: isAdded,
                    addToCart: () {
                      StoreProvider.of<AppState>(context).dispatch(
                        AddToCartAction(
                          products[index]['name']!,
                          products[index]['image']!,
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}