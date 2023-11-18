import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/navigate_models/payment_nav_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_text.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Icon(
              CupertinoIcons.checkmark_alt_circle_fill,
              color: Colors.green,
              size: 250,
            ),
            const Spacer(),
            AppText(
              text: "Rs. ${widget.payment.total}.00",
              fontColor: AppColors.highDeepBlue,
              size: 32,
              weight: FontWeight.bold,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Payment Complete",
              style: GoogleFonts.notoSansLinearB(
                  fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            Column(
              children: [
                const AppText(
                  text: "Your payment successfully complete",
                  fontColor: Colors.black,
                ),
                AppText(
                  text: "Transaction ID: ${widget.payment.paymentId}",
                  fontColor: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
