import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/api_models/order_model.dart';
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
        return true;
      } else if (response.statusCode == 404) {
        return false;
      }

      return null;
    } catch (exception) {
      return null;
    }
  }

  // check user
  static Future<OrderAPIResponseModel?> getOrdersByCustomer({required String email}) async {
    try {
      var queryParams = <String, String>{
        'email': email,
      };

      final url = Uri.parse(APIPath.baseAuthority + APIPath.order)
          .replace(queryParameters: queryParams);

      final response = await client.get(url, headers: headers).timeout(
        timeOut,
      );
      final jsonString = utf8.decode(response.bodyBytes);
      if (response.statusCode == 200) {
        final apiResponse = OrderAPIResponseModel.fromJson(jsonDecode(jsonString));
        return apiResponse;
      }

      return null;
    } catch (exception) {
      return null;
    }
  }

// // all farmers GET
// static Future<FarmerResponseModel?> farmersGet(
//     {required String token}) async {
//   try {
//     var headers = <String, String>{
//       'Content-Type': 'application/json',
//       'Accept': '/',
//       'Accept-Encoding': 'gzip, deflate, br',
//       'Authorization': 'Bearer $token',
//     };
//
//     final url = Uri.parse(
//       APIPath.baseAuthority + APIPath.allFarmers,
//     );
//
//     final response = await client
//         .get(
//       url,
//       headers: headers,
//     )
//         .timeout(
//       timeOut,
//     );
//
//     final jsonString = utf8.decode(response.bodyBytes);
//     if (response.statusCode == 200) {
//       final jsonString = utf8.decode(response.bodyBytes);
//
//       final apiResponse =
//       FarmerResponseModel.fromJson(jsonDecode(jsonString));
//
//       return apiResponse;
//     }
//
//     return null;
//   } catch (exception) {
//     Utils.logSave("farmer_get_api", exception.toString());
//     return null;
//   }
// }
//
// // master GET
// static Future<MasterResponseModel?> masterGet({required String token}) async {
//   try {
//     var headers = <String, String>{
//       'Content-Type': 'application/json',
//       'Accept': '/',
//       'Accept-Encoding': 'gzip, deflate, br',
//       'Authorization': 'Bearer $token',
//     };
//
//     final url = Uri.parse(
//       APIPath.baseAuthority + APIPath.master,
//     );
//
//     final response = await client
//         .get(
//       url,
//       headers: headers,
//     )
//         .timeout(
//       timeOut,
//     );
//
//     final jsonString = utf8.decode(response.bodyBytes);
//     if (response.statusCode == 200) {
//       final jsonString = utf8.decode(response.bodyBytes);
//
//       final apiResponse =
//       MasterResponseModel.fromJson(jsonDecode(jsonString));
//
//       return apiResponse;
//     }
//
//     return null;
//   } catch (exception) {
//     Utils.logSave("master_get_api", exception.toString());
//     return null;
//   }
// }
//
// // Farmer PUT
// static Future<bool> farmerPUT(
//     {required String token,
//       required List<FarmerSendModel> farmerList}) async {
//   try {
//     var headers = <String, String>{
//       'Content-Type': 'application/json',
//       'Accept': '/',
//       'Accept-Encoding': 'gzip, deflate, br',
//       'Authorization': 'Bearer $token',
//     };
//
//     var body = jsonEncode(
//       List<dynamic>.from(
//         farmerList.map(
//               (x) => x.toJson(),
//         ),
//       ),
//     );
//
//     final url = Uri.parse(
//       APIPath.baseAuthority + APIPath.farmers,
//     );
//
//     final response = await client.put(
//       url,
//       body: body,
//       headers: headers,
//     );
//
//     final jsonString = utf8.decode(response.bodyBytes);
//
//     if (response.statusCode == 200) {
//       final jsonString = utf8.decode(response.bodyBytes);
//
//       final apiResponse = genaricDataResponseModelFromJson(jsonString);
//       return apiResponse.message.toLowerCase() == 'update success'
//           ? true
//           : false;
//     }
//
//     return false;
//   } catch (exception) {
//     Utils.logSave("farmer_put_api", exception.toString());
//     return false;
//   }
// }
//
// // Farmer POST
// static Future<bool> farmerPOST(
//     {required String token,
//       required List<NewFarmerSendModel> farmerList}) async {
//   try {
//     var headers = <String, String>{
//       'Content-Type': 'application/json',
//       'Accept': '/',
//       'Accept-Encoding': 'gzip, deflate, br',
//       'Authorization': 'Bearer $token',
//     };
//
//     var body = jsonEncode(
//       List<dynamic>.from(
//         farmerList.map(
//               (x) => x.toJson(),
//         ),
//       ),
//     );
//
//     final url = Uri.parse(
//       APIPath.baseAuthority + APIPath.farmers,
//     );
//
//     final response = await client.post(
//       url,
//       body: body,
//       headers: headers,
//     );
//
//     final jsonString = utf8.decode(response.bodyBytes);
//
//     if (response.statusCode == 201) {
//       final jsonString = utf8.decode(response.bodyBytes);
//
//       final apiResponse = genaricDataResponseModelFromJson(jsonString);
//       return apiResponse.message.toLowerCase() == 'success' ? true : false;
//     }
//
//     return false;
//   } catch (exception) {
//     Utils.logSave("farmer_post_api", exception.toString());
//     return false;
//   }
// }
//
// // Purchase POST
// static Future<bool> purchasePOST(
//     {required String token,
//       required List<PurchaseSendModel> purchaseList}) async {
//   try {
//     var headers = <String, String>{
//       'Content-Type': 'application/json',
//       'Accept': '/',
//       'Accept-Encoding': 'gzip, deflate, br',
//       'Authorization': 'Bearer $token',
//     };
//
//     var body = jsonEncode(
//       //purchaseList.toJson();
//       List<dynamic>.from(
//         purchaseList.map(
//               (x) => x.toJson(),
//         ),
//       ),
//     );
//
//     final url = Uri.parse(
//       APIPath.baseAuthority + APIPath.purchase,
//     );
//
//     final response = await client.post(
//       url,
//       body: body,
//       headers: headers,
//     );
//
//     final jsonString = utf8.decode(response.bodyBytes);
//
//     if (response.statusCode == 201) {
//       final jsonString = utf8.decode(response.bodyBytes);
//
//       final apiResponse = genaricDataResponseModelFromJson(jsonString);
//       return apiResponse.message.toLowerCase() == 'success' ? true : false;
//     }
//
//     return false;
//   } catch (exception) {
//     Utils.logSave("purchase_post_api", exception.toString());
//     return false;
//   }
// }
//
// // Purchase note Get
// static Future<PurchaseNoteResponseModel?> purchaseAllGet(
//     {required String token}) async {
//   try {
//     var headers = <String, String>{
//       'Content-Type': 'application/json',
//       'Accept': '/',
//       'Accept-Encoding': 'gzip, deflate, br',
//       'Authorization': 'Bearer $token',
//     };
//
//     final url = Uri.parse(
//       APIPath.baseAuthority + APIPath.purchaseAll,
//     );
//
//     final response = await client
//         .get(
//       url,
//       headers: headers,
//     )
//         .timeout(
//       timeOut,
//     );
//
//     if (response.statusCode == 200) {
//       final jsonString = utf8.decode(response.bodyBytes);
//
//       final apiResponse =
//       PurchaseNoteResponseModel.fromJson(jsonDecode(jsonString));
//
//       return apiResponse;
//     }
//
//     return null;
//   } catch (exception) {
//     Utils.logSave("purchase_all_get_api", exception.toString());
//     return null;
//   }
// }
//
// // audit POST
// static Future<bool> auditPOST(
//     {required String token, required List<AuditSendModel> auditList}) async {
//   try {
//     var headers = <String, String>{
//       'Content-Type': 'application/json',
//       'Accept': '/',
//       'Accept-Encoding': 'gzip, deflate, br',
//       'Authorization': 'Bearer $token',
//     };
//
//     var body = jsonEncode(
//       List<dynamic>.from(
//         auditList.map(
//               (x) => x.toJson(),
//         ),
//       ),
//     );
//
//     final url = Uri.parse(
//       APIPath.baseAuthority + APIPath.auditResult,
//     );
//
//     final response = await client.post(
//       url,
//       body: body,
//       headers: headers,
//     );
//
//     final jsonString = utf8.decode(response.bodyBytes);
//
//     if (response.statusCode == 201) {
//       final jsonString = utf8.decode(response.bodyBytes);
//
//       final apiResponse = genaricDataResponseModelFromJson(jsonString);
//       return apiResponse.message.toLowerCase() == 'success' ? true : false;
//     }
//
//     return false;
//   } catch (exception) {
//     Utils.logSave("audit_post_api", exception.toString());
//     return false;
//   }
// }
//
// // farmer Get by ID
// static Future<SingleFarmerResponseModel?> farmerGetByID(
//     {required String token, required int id}) async {
//   try {
//     var headers = <String, String>{
//       'Content-Type': 'application/json',
//       'Accept': '/',
//       'Accept-Encoding': 'gzip, deflate, br',
//       'Authorization': 'Bearer $token',
//     };
//
//     var queryParams = <String, String>{
//       'farmerId': '$id',
//     };
//     final url = Uri.parse(APIPath.baseAuthority + APIPath.farmers)
//         .replace(queryParameters: queryParams);
//
//     final response = await client
//         .get(
//       url,
//       headers: headers,
//     )
//         .timeout(
//       timeOut,
//     );
//
//     if (response.statusCode == 200) {
//       final jsonString = utf8.decode(response.bodyBytes);
//
//       final apiResponse =
//       SingleFarmerResponseModel.fromJson(jsonDecode(jsonString));
//
//       return apiResponse;
//     }
//
//     return null;
//   } catch (exception) {
//     Utils.logSave("farmer_get_id_api", exception.toString());
//     return null;
//   }
// }
//
// // get purchase history by farmer id
// static Future<PurchaseHistoryResponseAPIModel?> purchaseHistoryGetByID(
//     {required String token, required int id}) async {
//   try {
//     var headers = <String, String>{
//       'Content-Type': 'application/json',
//       'Accept': '/',
//       'Accept-Encoding': 'gzip, deflate, br',
//       'Authorization': 'Bearer $token',
//     };
//
//     var queryParams = <String, String>{
//       'farmerID': '$id',
//     };
//     final url = Uri.parse(APIPath.baseAuthority + APIPath.purchaseHistory)
//         .replace(queryParameters: queryParams);
//
//     final response = await client
//         .get(
//       url,
//       headers: headers,
//     )
//         .timeout(
//       timeOut,
//     );
//
//     if (response.statusCode == 200) {
//       final jsonString = utf8.decode(response.bodyBytes);
//
//       final apiResponse =
//       PurchaseHistoryResponseAPIModel.fromJson(jsonDecode(jsonString));
//
//       return apiResponse;
//     }
//
//     return null;
//   } catch (exception) {
//     Utils.logSave("purchase_hist_get_id_api", exception.toString());
//     return null;
//   }
// }
//
// // get audit history by farmer id
// static Future<AuditResponseAPIModel?> auditHistoryGetByID(
//     {required String token, required int id}) async {
//   try {
//     var headers = <String, String>{
//       'Content-Type': 'application/json',
//       'Accept': '/',
//       'Accept-Encoding': 'gzip, deflate, br',
//       'Authorization': 'Bearer $token',
//     };
//
//     var queryParams = <String, String>{
//       'farmerID': '$id',
//     };
//     final url = Uri.parse(APIPath.baseAuthority + APIPath.auditHistory)
//         .replace(queryParameters: queryParams);
//
//     final response = await client
//         .get(
//       url,
//       headers: headers,
//     )
//         .timeout(
//       timeOut,
//     );
//     final jsonString = utf8.decode(response.bodyBytes);
//     if (response.statusCode == 200) {
//       final jsonString = utf8.decode(response.bodyBytes);
//
//       final apiResponse =
//       AuditResponseAPIModel.fromJson(jsonDecode(jsonString));
//
//       return apiResponse;
//     }
//
//     return null;
//   } catch (exception) {
//     Utils.logSave("audit_hist_get_id_api", exception.toString());
//     return null;
//   }
// }
//
// // farmers By FUnit GET
// static Future<FarmersUnitResponseModel?> farmersGetByFUnit(
//     {required String token, required int fid}) async {
//   try {
//     var headers = <String, String>{
//       'Content-Type': 'application/json',
//       'Accept': '/',
//       'Accept-Encoding': 'gzip, deflate, br',
//       'Authorization': 'Bearer $token',
//     };
//
//     var queryParams = <String, String>{
//       'fid': '$fid',
//     };
//
//     final url = Uri.parse(APIPath.baseAuthority + APIPath.farmersFUnit)
//         .replace(queryParameters: queryParams);
//
//     final response = await client
//         .get(
//       url,
//       headers: headers,
//     )
//         .timeout(
//       timeOut,
//     );
//
//     final jsonString = utf8.decode(response.bodyBytes);
//     if (response.statusCode == 200) {
//       final jsonString = utf8.decode(response.bodyBytes);
//
//       final apiResponse =
//       FarmersUnitResponseModel.fromJson(jsonDecode(jsonString));
//
//       return apiResponse;
//     }
//
//     return null;
//   } catch (exception) {
//     Utils.logSave("farmer_get_funit_api", exception.toString());
//     return null;
//   }
// }
//
// // field map GET
// static Future<FieldMapResponseAPIModel?> fieldMapGET(
//     {required String token}) async {
//   try {
//     var headers = <String, String>{
//       'Content-Type': 'application/json',
//       'Accept': '/',
//       'Accept-Encoding': 'gzip, deflate, br',
//       'Authorization': 'Bearer $token',
//     };
//
//     final url = Uri.parse(APIPath.baseAuthority + APIPath.fieldMap);
//
//     final response = await client
//         .get(
//       url,
//       headers: headers,
//     )
//         .timeout(
//       timeOut,
//     );
//
//     final jsonString = utf8.decode(response.bodyBytes);
//     if (response.statusCode == 200) {
//       final jsonString = utf8.decode(response.bodyBytes);
//
//       final apiResponse =
//       FieldMapResponseAPIModel.fromJson(jsonDecode(jsonString));
//
//       return apiResponse;
//     }
//
//     return null;
//   } catch (exception) {
//     Utils.logSave("field_map_get_api", exception.toString());
//     return null;
//   }
// }
}
