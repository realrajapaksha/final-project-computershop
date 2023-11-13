import 'package:flutter/material.dart';

import '../../../../../utils/widgets/app_text.dart';

class OrderStatusItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool done;

  const OrderStatusItem(
      {super.key, required this.icon, required this.title, required this.done});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
          color: done ? Colors.green : Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: done ? Colors.white : Colors.black,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            AppText(
              text: title,
              fontColor: done ? Colors.white : Colors.black,
              size: 14,
              weight: FontWeight.w800,
            ),
          ],
        ),
      ),
    );
  }
}
