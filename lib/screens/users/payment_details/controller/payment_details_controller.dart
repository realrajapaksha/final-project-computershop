import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/pay_product_model.dart';
import '../../../../models/navigate_models/payment_nav_model.dart';
import '../../../../routes/app_route.dart';
import '../../../../utils/widgets/apps_alert.dart';

class PaymentDetailsController extends GetxController {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final tele1Controller = TextEditingController();
  final tele2Controller = TextEditingController();
  final noteController = TextEditingController();

  final nameEmpty = false.obs;
  final addressEmpty = false.obs;
  final cityEmpty = false.obs;
  final tele1Empty = false.obs;

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

  Future<bool> validate() async {
    try {
      bool error = true;

      if (nameController.text
          .trim()
          .isEmpty) {
        error = false;
        nameEmpty.value = true;
      }
      if (addressController.text
          .trim()
          .isEmpty) {
        error = false;
        addressEmpty.value = true;
      }
      if (cityController.text
          .trim()
          .isEmpty) {
        error = false;
        cityEmpty.value = true;
      }
      if (tele1Controller.text
          .trim()
          .isEmpty) {
        error = false;
        tele1Empty.value = true;
      }

      return error;
    } catch (exception) {
      return false;
    }
  }

  Future<void> makePayment(context) async {
    if (!await validate()) {
      return;
    }

    final res = await AppsAlerts().openDialog(
        context, "Action", "Are sure to purchase these items?",
        btnYN: true);
    if (!res) {
      return;
    }

    await AppsAlerts().openLoading(context, "Waiting for Payment..");

    try {
      int tot = total.value.toInt() * 100;

      paymentIntent = await createPaymentIntent(tot, 'LKR');

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            intentConfiguration: IntentConfiguration(
              mode: IntentMode(currencyCode: "LKR", amount: tot),
            ),
            paymentIntentClientSecret: paymentIntent!['client_secret'],
            style: ThemeMode.dark,
            merchantDisplayName: 'LK'),
      )
          .then((value) {});

      //STEP 3: Display Payment sheet
      await displayPaymentSheet(context);
    } catch (err) {
      await AppsAlerts.closeAllDialogs(context);
      await AppsAlerts().openDialog(context, "Payment Cancelled",
          "Something went wrong. Please try again.");
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

  displayPaymentSheet(context) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        saveDatabase(context);
      }).onError((error, stackTrace) async {
        // payment dismiss
        await AppsAlerts.closeAllDialogs(context);
        await AppsAlerts().openDialog(
            context, "Payment Cancelled", "Payment cancelled by user");
      });
    } on StripeException catch (e) {
      await AppsAlerts.closeAllDialogs(context);
      await AppsAlerts()
          .openDialog(context, "Payment Dismiss", "Something went wrong");
    } catch (e) {
      await AppsAlerts.closeAllDialogs(context);
      await AppsAlerts()
          .openDialog(context, "Payment Dismiss", "Something went wrong!");
    }
  }

  saveDatabase(context) async {
    try {
      if (paymentIntent != null) {
        print(paymentIntent!["id"]);

        // final model = PaymentNavModel(
        //     paymentId: paymentIntent!["id"], order: order, itemList: itemList)

        AppsAlerts.closeAllDialogs(context);
        Navigator.popAndPushNamed(
            context, AppRoute.paymentSuccess, arguments: "");
      }
    } catch (exception) {
      await AppsAlerts.closeAllDialogs(context);
      await AppsAlerts().openDialog(context, "Payment Cancelled",
          "Your payment id is: ${paymentIntent!["id"]}.\n Something went wrong. Please contact shop to refund.");
    }
  }
}
