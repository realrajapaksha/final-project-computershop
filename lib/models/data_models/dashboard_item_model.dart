class DashboardItemModel {
  final String id;
  final String name;
  final String category;
  final int price;
  final String description;
  final int qty;
  final String image;

  const DashboardItemModel(
      {required this.id,
      required this.name,
      required this.category,
      required this.price,
      required this.description,
      required this.qty,
      required this.image});
}
