import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:computershop/models/data_models/payment_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import '../../../../models/api_models/order_model.dart';
import '../../../../models/data_models/order_product_model.dart';
import '../../../../models/data_models/pay_product_model.dart';
import '../../../../models/navigate_models/payment_nav_model.dart';
import '../../../../routes/app_route.dart';
import '../../../../utils/shared_values.dart';
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

  final db = FirebaseFirestore.instance;

  initialize(List<PayProductModel> navList) async {
    try {
      productList.clear();
      for (var item in navList) {
        total.value = total.value + (item.price * item.qty);
        productList.add(item);
      }
      await getProfileDetails();
    } catch (exception) {
      //
    }
  }

  getProfileDetails() async {
    try {
      await db
          .collection("users")
          .doc(SharedValues.shared.email)
          .get()
          .then((value) {
        if (value.exists) {
          nameController.text = value["fullName"];
          addressController.text = value["address"];
          cityController.text = value["city"];
          tele1Controller.text = value["tele1"];
          tele2Controller.text = value["tele2"];
          noteController.text = value["note"];
        }
      });
    } catch (exception) {
      //
    }
  }

  Future<bool> validate() async {
    try {
      bool error = true;

      if (nameController.text.trim().isEmpty) {
        error = false;
        nameEmpty.value = true;
      }
      if (addressController.text.trim().isEmpty) {
        error = false;
        addressEmpty.value = true;
      }
      if (cityController.text.trim().isEmpty) {
        error = false;
        cityEmpty.value = true;
      }
      if (tele1Controller.text.trim().isEmpty) {
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
        final order = OrderModel(
            orderId: "",
            paymentId: paymentIntent!["id"],
            userId: SharedValues.shared.email,
            paymentMethod: "card",
            status: "Pending",
            address: addressController.text.trim(),
            city: cityController.text.trim(),
            date: DateTime.now().millisecondsSinceEpoch,
            note: noteController.text.trim(),
            tele1: tele1Controller.text.trim(),
            tele2: tele2Controller.text.trim(),
            pname: "",
            quantity: 0,
            image: "",
            price: 0);

        await db
            .collection("orders")
            .add(order.toFireStore())
            .then((result) async {
          List<OrderProductModel> itemList = [];
          int totalPrice = 0;
          for (var item in productList) {
            totalPrice + totalPrice + item.price;
            itemList.add(OrderProductModel(
                orderId: result.id,
                productId: item.productId,
                quantity: item.qty,
                date: DateTime.now().millisecondsSinceEpoch));
          }

          final paymentModel = PaymentModel(
              paymentId: paymentIntent!["id"],
              orderId: result.id,
              userId: SharedValues.shared.email,
              date: DateTime.now().millisecondsSinceEpoch,
              total: totalPrice);

          await db
              .collection("payment")
              .add(paymentModel.toAddFireStore())
              .then((value) async {
            for (var orderItem in itemList) {
              await db
                  .collection("order_products")
                  .add(orderItem.toFireStore())
                  .then((value) async {
                final model = PaymentNavModel(
                    paymentId: paymentIntent!["id"],
                    order: order,
                    itemList: itemList);

                await db.collection("products").doc(orderItem.productId).update(
                    {"quantity": FieldValue.increment(-orderItem.quantity)});

                await db
                    .collection("cart")
                    .where("productId", isEqualTo: orderItem.productId)
                    .get()
                    .then((value) async {
                  if (value.docs.isNotEmpty) {
                    for (var cartItem in value.docs) {
                      await db.collection("cart").doc(cartItem.id).delete();
                    }
                  }
                });

                AppsAlerts.closeAllDialogs(context);
                Navigator.popAndPushNamed(context, AppRoute.paymentSuccess,
                    arguments: model);
              });
            }
          });
        });
      }
    } catch (exception) {
      await AppsAlerts.closeAllDialogs(context);
      await AppsAlerts().openDialog(context, "Payment Cancelled",
          "Your payment id is: ${paymentIntent!["id"]}.\n Something went wrong. Please contact shop to refund.");
    }
  }
}
