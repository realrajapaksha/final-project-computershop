import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/payment_details_controller.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final controller = Get.put(PaymentDetailsController());

  @override
  void initState() {
    super.initState();
    //controller.initialize();
  }

  @override
  void dispose() {
    Get.delete<PaymentDetailsController>();
    super.dispose();
  }

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
