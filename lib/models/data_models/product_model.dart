class ProductModel {
  final String productId;
  final String pname;
  final int quantity;
  final int price;
  final String description;
  final String tags;
  final String image;
  final String category;

  ProductModel(
      {required this.productId,
      required this.pname,
      required this.quantity,
      required this.price,
      required this.description,
      required this.tags,
      required this.image,
      required this.category});

  Map<String, dynamic> toFireStore() {
    return {
      "pname": pname,
      "quantity": quantity,
      "price": price,
      "description": description,
      "tags": tags,
      "image": image,
      "category": category,
    };
  }
}
