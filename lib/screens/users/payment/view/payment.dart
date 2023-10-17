import 'package:computershop/screens/users/payment/controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              controller.makePayment(context);
            },
            child: Text("Pay")),
      ),
    );
  }
}
