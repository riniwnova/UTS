import 'package:flutter_redux_project/cart_item.dart';
import 'package:redux/redux.dart';
import 'app_state.dart';

final Store<AppState> store = Store<AppState>(
  (state, action) => AppState(
    cartItems: cartReducer(state.cartItems, action),
  ),
  initialState: AppState.initial(),
);

cartReducer(List<CartItem> cartItems, action) {}