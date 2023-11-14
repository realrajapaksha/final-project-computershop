class CartModel {
  final String cartId;
  final String productId;
  final String userId;
  final int date;
  final String pname;
  final int price;
  final int aunits;
  final String image;

  const CartModel(
      {required this.cartId,
      required this.productId,
      required this.userId,
      required this.date,
      required this.pname,
      required this.price,
      required this.aunits,
      required this.image});

  Map<String, dynamic> toAddFireStore() {
    return {
      "productId": productId,
      "userId": userId,
      "date": date,
    };
  }
}
