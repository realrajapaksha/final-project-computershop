class OrderProductModel {
  final String orderId;
  final String productId;
  final int quantity;
  final int date;

  const OrderProductModel(
      {required this.orderId,
      required this.productId,
      required this.quantity,
      required this.date});

  Map<String, dynamic> toFireStore() {
    return {
      "orderId": orderId,
      "productId": productId,
      "quantity": quantity,
      "date": date,
    };
  }
}
