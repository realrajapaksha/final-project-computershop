import 'package:flutter/material.dart';

import '../../../../../utils/widgets/app_text.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: const BoxDecoration(),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "item one, item two",
                    size: 15,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppText(
                      text: "#Order ID: 454fdsfhghr65fdfdfg51d5sg4d5g4dsg"),
                ],
              ),
              Column(
                children: [
                  AppText(text: "2023-10-20"),
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white70,
                  ),
                ],
              )
            ],
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
