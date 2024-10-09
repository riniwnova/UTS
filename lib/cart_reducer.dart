import 'cart_actions.dart';
import 'cart_item.dart';
import 'app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is AddToCartAction) {
    return AppState(cartItems: [
      ...state.cartItems,
      CartItem(
        productName: action.productName,
        productImage: action.productImage,
      ),
    ]);
  } else if (action is RemoveFromCartAction) {
    return AppState(
      cartItems: state.cartItems
          .where((item) => item.productName != action.productName)
          .toList(),
    );
  } else if (action is IncreaseQuantityAction) {
    return AppState(
      cartItems: state.cartItems.map((item) {
        if (item.productName == action.productName) {
          return CartItem(
            productName: item.productName,
            productImage: item.productImage,
            quantity: item.quantity + 1,
          );
        }
        return item;
      }).toList(),
    );
  } else if (action is DecreaseQuantityAction) {
    return AppState(
      cartItems: state.cartItems.map((item) {
        if (item.productName == action.productName && item.quantity > 1) {
          return CartItem(
            productName: item.productName,
            productImage: item.productImage,
            quantity: item.quantity - 1,
          );
        }
        return item;
      }).toList(),
    );
  }

  return state;
}