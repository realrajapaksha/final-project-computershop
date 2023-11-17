class PaymentModel{
  final String paymentId;
  final String orderId;
  final String userId;
  final int date;

  const PaymentModel({required this.paymentId, required this.orderId, required this.userId, required this.date});

  Map<String, dynamic> toAddFireStore() {
    return {
      "paymentId": paymentId,
      "orderId": orderId,
      "userId": userId,
      "date": date,
    };
  }
}