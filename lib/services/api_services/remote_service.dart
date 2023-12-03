import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/api_models/ai_result_model.dart';
import '../../models/data_models/user_model.dart';
import '../../utils/shared_values.dart';
import 'api_path.dart';

class RemoteService {
  static var client = http.Client();

  static var headers = <String, String>{
    'Content-Type': 'application/json',
    'Accept': '*/*',
    'Accept-Encoding': 'gzip, deflate, br',
  };

  static var timeOut = const Duration(seconds: 30);

  // user register
  static Future<bool> userRegister({required UserModel userModel}) async {
    try {
      var body = jsonEncode(
        userModel.toFireStore(),
      );

      final url = Uri.parse(
        APIPath.baseAuthority + APIPath.user,
      );

      final response = await client
          .post(
            url,
            body: body,
            headers: headers,
          )
          .timeout(
            timeOut,
          );

      final jsonString = utf8.decode(response.bodyBytes);

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (exception) {
      return false;
    }
  }

  // check user
  static Future<bool?> checkUser({required String email}) async {
    try {
      var queryParams = <String, String>{
        'email': email,
      };

      final url = Uri.parse(APIPath.baseAuthority + APIPath.user)
          .replace(queryParameters: queryParams);

      final response = await client.get(url, headers: headers).timeout(
            timeOut,
          );
      final jsonString = utf8.decode(response.bodyBytes);
      if (response.statusCode == 200) {
        final apiResponse = UserModel.fromJson(jsonDecode(jsonString));
        SharedValues.shared.setUsername(apiResponse.fullName);
        SharedValues.shared.setType(apiResponse.type);
        SharedValues.shared.setStatus(apiResponse.status);
        return true;
      } else if (response.statusCode == 404) {
        return false;
      }

      return null;
    } catch (exception) {
      return null;
    }
  }

  // check AI
  static Future<String?> connectAI({required String search}) async {
    try {
      var queryParams = <String, String>{
        'keyword': search,
      };

      //emulator: 10.0.2.2   localhost
      final url = Uri.parse("https://daring-gnu-daily.ngrok-free.app/search")
          .replace(queryParameters: queryParams);

      final response = await client.get(url, headers: headers).timeout(
            timeOut,
          );
      final jsonString = utf8.decode(response.bodyBytes);
      if (response.statusCode == 200) {
        final apiResponse = AIResultModel.fromJson(jsonDecode(jsonString));
        return apiResponse.response;
      } else if (response.statusCode == 404) {
        return "";
      }

      return null;
    } catch (exception) {
      print(exception);
      return null;
    }
  }
}
