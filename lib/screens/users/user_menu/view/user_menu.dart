import 'package:flutter/material.dart';

import '../../../../routes/app_route.dart';
import '../../../../utils/widgets/app_text.dart';

class UserMenu extends StatefulWidget {
  const UserMenu({super.key});

  @override
  State<UserMenu> createState() => _UserMenuState();
}

class _UserMenuState extends State<UserMenu> {
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
                    Navigator.pushNamed(context, AppRoute.watchList);
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
                          text: "Watchlist",
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
                    Navigator.pushNamed(context, AppRoute.chat);
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
                    Navigator.pushNamed(context, AppRoute.contactSupport);
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
                          text: "Customer Support",
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
