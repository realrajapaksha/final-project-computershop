import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class ViewComplain extends StatefulWidget {
  const ViewComplain({super.key});

  @override
  State<ViewComplain> createState() => _ViewComplainState();
}

class _ViewComplainState extends State<ViewComplain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.highDeepBlue,
              AppColors.deepBlue,
              AppColors.lowDeepBlue
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text("View Complains"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
