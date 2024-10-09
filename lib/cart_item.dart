class CartItem {
  final String productName;
  final String productImage;
  int quantity;

  CartItem({
    required this.productName,
    required this.productImage,
    this.quantity = 1,
  });
}