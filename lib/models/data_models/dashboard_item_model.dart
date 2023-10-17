class DashboardItemModel {
  final String id;
  final String name;
  final String category;
  final double price;
  final String description;
  final int qty;

  const DashboardItemModel(
      {required this.id,
      required this.name,
      required this.category,
      required this.price,
      required this.description,
      required this.qty});
}