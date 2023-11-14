import 'dart:ui';

import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppAlertShow extends StatelessWidget {
  final Animation<double> a1;
  final Animation<double> a2;
  final String title;
  final String message;
  final bool btnYN;
  final bool isWarning;
  final bool dismiss;

  const AppAlertShow(
      {Key? key,
      required this.a1,
      required this.a2,
      required this.title,
      required this.message,
      this.btnYN = false,
      this.isWarning = false,
      this.dismiss = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => dismiss,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            message,
                            style: const TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.zero,
                                  ),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: const Radius.circular(10),
                                        bottomRight:
                                            Radius.circular(btnYN ? 0 : 10),
                                      ),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    AppColors.white,
                                  ),
                                ),
                                child: Text(
                                  btnYN ? "NO" : "OK",
                                  style: const TextStyle(
                                      fontSize: 15, color: AppColors.mainBlue),
                                ),
                              ),
                            ),
                            btnYN
                                ? Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                            EdgeInsets>(
                                          EdgeInsets.zero,
                                        ),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          AppColors.white,
                                        ),
                                      ),
                                      child: const Text(
                                        "YES",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.mainBlue),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
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
                            color: isWarning
                                ? Colors.deepOrangeAccent
                                : AppColors.mainBlue,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: isWarning
                              ? const Icon(Icons.cancel_outlined,
                                  size: 35, color: Colors.deepOrangeAccent)
                              : ClipRect(
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
