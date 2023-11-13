class OrderAPIResponseModel {
  final List<OrderModel> orderList;

  const OrderAPIResponseModel({required this.orderList});

  factory OrderAPIResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderAPIResponseModel(
        orderList: List<OrderModel>.from(
          json["data"].map(
            (x) => OrderModel.fromJson(x),
          ),
        ),
      );
}

class OrderModel {
  final String orderId;
  final String paymentId;
  final String userId;
  final String paymentMethod;
  final String status;
  final String address;
  final String city;
  final int date;
  final String note;
  final String tele1;
  final String tele2;
  final String pname;
  final int quantity;
  final String image;
  final int price;

  const OrderModel(
      {required this.orderId,
      required this.paymentId,
      required this.userId,
      required this.paymentMethod,
      required this.status,
      required this.address,
      required this.city,
      required this.date,
      required this.note,
      required this.tele1,
      required this.tele2,
      required this.pname,
      required this.quantity,
      required this.image,
      required this.price});

  Map<String, dynamic> toFireStore() {
    return {
      "orderId": orderId,
      "paymentId": paymentId,
      "userId": userId,
      "paymentMethod": paymentMethod,
      "status": status,
      "address": address,
      "city": city,
      "date": date,
      "note": note,
      "tele1": tele1,
      "tele2": tele2,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderId: json["orderId"],
        paymentId: json["paymentId"],
        userId: json["userId"],
        paymentMethod: json["paymentMethod"],
        status: json["status"],
        address: json["address"],
        city: json["city"],
        date: json["date"],
        note: json["note"],
        tele1: json["tele1"],
        tele2: json["tele2"],
        pname: json["tele1"],
        quantity: json["pname"],
        image: json["image"],
        price: json["price"],
      );
}
