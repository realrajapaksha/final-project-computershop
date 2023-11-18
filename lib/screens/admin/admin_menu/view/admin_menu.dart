import 'package:flutter/material.dart';

import '../../../../routes/app_route.dart';
import '../../../../utils/widgets/app_text.dart';

class AdminMenu extends StatefulWidget {
  const AdminMenu({super.key});

  @override
  State<AdminMenu> createState() => _AdminMenuState();
}

class _AdminMenuState extends State<AdminMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.white,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text("Menu"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.chatList);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "Chat",
                          size: 14,
                        ),
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.complains);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "Complains",
                          size: 14,
                        ),
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
