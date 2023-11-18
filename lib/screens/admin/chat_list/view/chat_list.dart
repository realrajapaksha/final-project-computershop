import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/widgets/app_text.dart';
import '../controller/chat_list_controller.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final controller = Get.put(ChatListController());

  @override
  void initState() {
    super.initState();
    controller.getChatList();
  }

  @override
  void dispose() {
    Get.delete<ChatListController>();
    super.dispose();
  }

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
      child: Obx(
        () => Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
            titleSpacing: 0,
            centerTitle: true,
            title: const Text("Chat List"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: controller.loading.value
                  ? const Center(
                      child: CupertinoActivityIndicator(
                        color: Colors.white,
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.chatList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            await Navigator.pushNamed(context, AppRoute.chat,
                                arguments: controller.chatList[index].email);
                            controller.getChatList();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              decoration:
                                  const BoxDecoration(color: Colors.white70),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          controller.chatList[index].image,
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  AppText(
                                    text: controller.chatList[index].name,
                                    fontColor: AppColors.highDeepBlue,
                                    size: 15,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
            ),
          ),
        ),
      ),
    );
  }
}
