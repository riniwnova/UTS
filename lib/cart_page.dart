import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_project/cart_actions.dart';
import 'app_state.dart';
import 'cart_item.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: StoreConnector<AppState, List<CartItem>>(
        converter: (store) => store.state.cartItems,
        builder: (context, cartItems) {
          if (cartItems.isEmpty) {
            return Center(child: Text('No items in the cart'));
          }
          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), 
                child: Card( 
                  child: ListTile(
                    leading: Image.asset(item.productImage, width: 50),
                    title: Text(
                      item.productName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text('Quantity: ${item.quantity}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            if (item.quantity == 1) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Confirm Removal'),
                                    content: Text(
                                      'Are you sure you want to remove "${item.productName}" from the cart?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(); 
                                        },
                                        child: Text('No'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          StoreProvider.of<AppState>(context).dispatch(
                                            RemoveFromCartAction(item.productName),
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Yes'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              StoreProvider.of<AppState>(context).dispatch(
                                DecreaseQuantityAction(item.productName),
                              );
                            }
                          },
                        ),
                        Text(item.quantity.toString()),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            StoreProvider.of<AppState>(context).dispatch(
                              IncreaseQuantityAction(item.productName),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}