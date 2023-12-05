import 'dart:convert';

import 'package:http/http.dart';

class EmailService {
  Future<bool> sendOrderStatusEmail(
      String toName,
      String orderId,
      String orderDate,
      String orderName,
      String orderAddress,
      String orderPid,
      String orderPrice,
      String orderStatus,
      String toEmail) async {
    try {
      var client = Client();

      String serviceId = "service_dgom1pg";
      String templateId = "template_o7ciruk";
      String userId = "n8wMB6ATKYYPfXR2n";
      String private = "VZGJoq8wN56NsYyniYhk3";

      var data = jsonEncode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userId,
        "accessToken": private,
        "template_params": {
          'to_name': toName,
          'order_id': orderId,
          'order_date': orderDate,
          'order_name': orderName,
          'order_address': orderAddress,
          'order_pid': orderPid,
          'order_price': orderPrice,
          'order_status': orderStatus,
          'to_email': toEmail
        }
      });

      var headers = <String, String>{
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br'
      };

      final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

      final response = await client
          .post(url, headers: headers, body: data)
          .timeout(const Duration(seconds: 15));

      final jsonString = utf8.decode(response.bodyBytes);

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (exception) {
      return false;
    }
  }
}
