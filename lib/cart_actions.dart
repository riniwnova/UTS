class AddToCartAction {
  final String productName;
  final String productImage;

  AddToCartAction(this.productName, this.productImage);
}

class RemoveFromCartAction {
  final String productName;

  RemoveFromCartAction(this.productName);
}

class IncreaseQuantityAction {
  final String productName;

  IncreaseQuantityAction(this.productName);
}

class DecreaseQuantityAction {
  final String productName;

  DecreaseQuantityAction(this.productName);
}