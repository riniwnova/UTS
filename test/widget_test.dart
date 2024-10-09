import 'package:flutter/material.dart';
import 'package:flutter_redux_project/app_state.dart';
import 'package:flutter_redux_project/cart_reducer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../lib/cart_page.dart'; // Ganti path sesuai dengan struktur foldermu

void main() {
  testWidgets('CartPage displays empty message when no items', (WidgetTester tester) async {
    // Create a new store with initial state
    final store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
    );

    // Build our app and trigger a frame
    await tester.pumpWidget(StoreProvider(
      store: store,
      child: MaterialApp(home: CartPage()),
    ));

    // Verify that the message is displayed
    expect(find.text('No items in the cart'), findsOneWidget);
  });

  // Tambahkan tes lainnya di sini sesuai kebutuhan
}