import 'dart:convert';
import 'package:http/http.dart';

class FCMSendNotification {
  static Future<bool> sendNotification(
      String token, String title, String message) async {
    try {
      var client = Client();

      var body = jsonEncode({
        "notification": {"title": title, "body": message},
        "to": token
      });

      var headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'key=AAAAdZ6e6Oo:APA91bFG2UR7ESMW7ur2HUsPV9oiS7qoirXoFdPCO1vhaEIUBqMC9fez1CxhvbYsdSh5tQZM89CF6e7o3fQcv_5KC-W3B54QhrAt9HvPUzw2czGHPcDuo3bWDS96g1DocsvDb8LjyECQ'
      };

      final url = Uri.parse("https://fcm.googleapis.com/fcm/send");

      final response = await client
          .post(url, headers: headers, body: body)
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

  static Future<bool> sendTopicNotification(
      String to, String title, String message) async {
    try {
      var client = Client();

      var body = jsonEncode({
        "notification": {"title": title, "body": message},
        "to": "/topics/$to"
      });

      var headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'key=AAAAdZ6e6Oo:APA91bFG2UR7ESMW7ur2HUsPV9oiS7qoirXoFdPCO1vhaEIUBqMC9fez1CxhvbYsdSh5tQZM89CF6e7o3fQcv_5KC-W3B54QhrAt9HvPUzw2czGHPcDuo3bWDS96g1DocsvDb8LjyECQ'
      };

      final url = Uri.parse("https://fcm.googleapis.com/fcm/send");

      final response = await client
          .post(url, headers: headers, body: body)
          .timeout(const Duration(seconds: 15));

      final jsonString = utf8.decode(response.bodyBytes);

      if (response.statusCode == 200) {
        final extractedData = jsonDecode(jsonString) as Map<String, dynamic>;
        if (extractedData["message_id"] != null) {
          return true;
        }
      }

      return false;
    } catch (exception) {
      return false;
    }
  }
}
