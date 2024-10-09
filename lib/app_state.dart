import 'cart_item.dart';

class AppState {
  final List<CartItem> cartItems;

  AppState({this.cartItems = const []});

  factory AppState.initial() {
    return AppState(cartItems: []);
  }
}