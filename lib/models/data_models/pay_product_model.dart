class PayProductModel {
  final String productId;
  final String pname;
  final String image;
  final int availableUnits;
  final int buyUnits;
  final int price;

  const PayProductModel(
      {required this.productId,
      required this.pname,
      required this.image,
      required this.availableUnits,
      required this.buyUnits,
      required this.price});
}
