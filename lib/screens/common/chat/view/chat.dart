import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../controller/chat_controller.dart';
import 'widgets/message_item.dart';

class Chat extends StatefulWidget {
  final String? fromMail;

  const Chat({Key? key, required this.fromMail}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final ChatController chatController = Get.put(ChatController());

  @override
  void initState() {
    super.initState();
    chatController.chatListen(widget.fromMail);
  }

  @override
  void dispose() {
    chatController.listener.cancel();
    Get.delete<ChatController>();
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
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
            titleSpacing: 0,
            centerTitle: true,
            title: const Text("Live Chat"),
          ),
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => Expanded(
                      child: ListView.separated(
                        physics: const PageScrollPhysics(),
                        separatorBuilder: (_, index) => const SizedBox(
                          height: 5,
                        ),
                        reverse: true,
                        itemCount: chatController.messageList.length,
                        itemBuilder: (context, index) {
                          final message = chatController.messageList[index];
                          return MessageItem(message: message);
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.only(left: 16, right: 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            maxLines: null,
                            textAlign: TextAlign.start,
                            controller: chatController.message,
                            decoration: const InputDecoration(
                              hintText: 'Type your message here...',
                              constraints: BoxConstraints(
                                maxHeight: 100,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (chatController.message.text.trim().isNotEmpty) {
                              chatController.sendMessage();
                            }
                          },
                          icon: const Icon(Icons.send),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
