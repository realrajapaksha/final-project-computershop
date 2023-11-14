import '../api_models/order_model.dart';
import '../data_models/order_product_model.dart';

class PaymentNavModel {
  final String paymentId;
  final OrderModel order;
  final List<OrderProductModel> itemList;

  const PaymentNavModel(
      {required this.paymentId, required this.order, required this.itemList});
}
