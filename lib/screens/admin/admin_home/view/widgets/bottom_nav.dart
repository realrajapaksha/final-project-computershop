import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../../utils/app_colors.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueSetter<int> onTap;

  const BottomNav({Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: AppColors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: GNav(
            selectedIndex: currentIndex,
            onTabChange: (int value) {
              onTap(value);
            },
            tabBorderRadius: 15,
            tabActiveBorder: Border.all(color: AppColors.lowLightBlue),
            duration: const Duration(milliseconds: 200),
            gap: 8,
            color: Colors.grey,
            activeColor: AppColors.highDeepBlue,
            iconSize: 24,
            tabBackgroundColor: AppColors.lowLightBlue,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            tabs: const [
              GButton(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                margin: EdgeInsets.symmetric(vertical: 5),
                icon: Icons.shopping_bag,
                text: 'Orders',
              ),
              GButton(
                margin: EdgeInsets.symmetric(vertical: 5),
                icon: Icons.paid,
                text: 'Sales',
              ),
              GButton(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                icon: Icons.dashboard_customize,
                text: 'Menu',
              )
            ]),
      ),
    );
  }
}
