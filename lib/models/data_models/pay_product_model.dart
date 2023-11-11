class PayProductModel {
  final String productId;
  final String pname;
  final String image;
  final int qty;
  final double price;

  const PayProductModel(
      {required this.productId,
      required this.pname,
        required this.image,
      required this.qty,
      required this.price});
}
