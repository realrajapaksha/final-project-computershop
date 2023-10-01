import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final double fontSize;
  final Color titleColor;
  final FontWeight fontWeight;
  final VoidCallback onTapped;

  const AppButton(
      {Key? key,
      required this.title,
      this.bgColor = AppColors.mainBlue,
      this.fontSize = 18,
      this.titleColor = AppColors.white,
      this.fontWeight = FontWeight.bold,
      required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTapped();
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.zero,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          bgColor,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontWeight: fontWeight, fontSize: fontSize, color: titleColor),
          ),
        ),
      ),
    );
  }
}
