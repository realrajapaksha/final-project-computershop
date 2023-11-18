class ReportModel {
  final String productId;
  final String userId;
  final int date;
  final String description;

  const ReportModel({
    required this.productId,
    required this.userId,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toAddFireStore() {
    return {
      "productId": productId,
      "userId": userId,
      "date": date,
      "description": description
    };
  }
}
