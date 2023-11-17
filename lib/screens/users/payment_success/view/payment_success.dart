import 'package:flutter/material.dart';

import '../../../../models/navigate_models/payment_nav_model.dart';

class PaymentSuccess extends StatefulWidget {
  final PaymentNavModel payment;
  const PaymentSuccess({super.key, required this.payment});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {

  @override
  void initState() {
    super.initState();
    print(widget.payment);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
