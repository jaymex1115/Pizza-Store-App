class OrderItem {
  final String name;
  final int quantity;
  final double unitPrice;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.unitPrice,
  });
}

double orderTotal(List<OrderItem> items) {
  return items.fold(0.0, (sum, item) => sum + (item.unitPrice * item.quantity));
}
