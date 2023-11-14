import 'dart:ui';

import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppAlertLoading extends StatelessWidget {
  final Animation<double> a1;
  final Animation<double> a2;
  final String message;

  const AppAlertLoading(
      {Key? key, required this.a1, required this.a2, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.1, end: 1.1).animate(a1),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.1, end: 1.0).animate(a1),
            child: Dialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 35),
                    margin: const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Please Wait",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                message,
                                style: const TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.mainBlue,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRect(
                            child: Image.asset("assets/images/logo.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
