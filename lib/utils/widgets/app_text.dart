import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final Color fontColor;
  final Color backColor;
  final double size;
  final TextAlign align;
  final TextOverflow overflow;
  final bool softWrap;

  const AppText(
      {Key? key,
      required this.text,
      this.weight = FontWeight.normal,
      this.fontColor = AppColors.white,
      this.backColor = Colors.transparent,
      this.size = 12,
      this.align = TextAlign.justify,
      this.overflow = TextOverflow.visible,
      this.softWrap = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        textAlign: align,
        overflow: overflow,
        softWrap: softWrap,
        style: TextStyle(
            color: fontColor,
            fontSize: size,
            fontWeight: weight,
            backgroundColor: backColor),
      ),
    );
  }
}
