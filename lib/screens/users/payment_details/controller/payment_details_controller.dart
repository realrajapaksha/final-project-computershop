import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/pay_product_model.dart';

class PaymentDetailsController extends GetxController {
  Map<String, dynamic>? paymentIntent;

  final productList = <PayProductModel>[].obs;

  final total = 0.0.obs;

  initialize(List<PayProductModel> navList) async {
    try {
      productList.clear();
      for (var item in navList) {
        total.value = total.value + (item.price * item.qty);
        productList.add(item);
      }
    } catch (exception) {
      //
    }
  }

  Future<void> makePayment(context) async {
    try {
      int tot = total.value.toInt() * 100;

      paymentIntent = await createPaymentIntent(tot, 'LKR');

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                intentConfiguration: IntentConfiguration(
                  mode: IntentMode(
                      currencyCode: "LKR", amount: tot),
                ),
                paymentIntentClientSecret: paymentIntent!['client_secret'],
                style: ThemeMode.dark,
                merchantDisplayName: 'LK'),
          )
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet(context);
    } catch (err) {
      throw Exception(err);
    }
  }

  displayPaymentSheet(context) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
            context: context,
            builder: (_) => const AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 100.0,
                      ),
                      SizedBox(height: 10.0),
                      Text("Payment Successful!"),
                    ],
                  ),
                ));

        paymentIntent = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(int amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': amount.toString(),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51NSOXNEJSo66fUeP3eSP3PDoaFlGcD3w8IwvI8guumPqSywc4PBiNym2kiR7GzT7VjQB5hUl2tAgRdS7s3LwXM2S00xAZzOLrm',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
