import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_text.dart';

class ContactSupport extends StatefulWidget {
  const ContactSupport({super.key});

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
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
          title: const Text("Contact Support"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    await canLaunchUrl(Uri(scheme: "tel", path: "0777292272"));
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(text: "Telephone: 0777292272"),
                        Icon(
                          CupertinoIcons.phone,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    MapsLauncher.launchCoordinates(
                        6.847202417593622, 79.865918989532);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                            text:
                                "Location: 110A Galle Rd, Dehiwala-Mount Lavinia"),
                        Icon(
                          CupertinoIcons.location,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await canLaunchUrl(
                        Uri(scheme: "mailto", path: "help@nanoteck.com"));
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(text: "Email: help@nanoteck.com"),
                        Icon(
                          CupertinoIcons.mail,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
