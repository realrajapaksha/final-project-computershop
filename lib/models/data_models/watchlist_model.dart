class WatchlistModel {
  final String watchId;
  final String productId;
  final String userId;
  final int date;
  final String pname;
  final int price;
  final String image;

  const WatchlistModel(
      {required this.watchId,
      required this.productId,
      required this.userId,
      required this.date,
      required this.pname,
      required this.price,
      required this.image});
}
