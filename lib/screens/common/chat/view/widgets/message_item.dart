import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../models/data_models/message_model.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/shared_values.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../controller/chat_controller.dart';

class MessageItem extends StatefulWidget {
  final MessageModel message;

  const MessageItem({Key? key, required this.message}) : super(key: key);

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  final ChatController chatController = Get.find<ChatController>();
  bool open = false;

  @override
  Widget build(BuildContext context) {
    final message = widget.message;

    return message.fromType == SharedValues.shared.type
        ? Wrap(
            alignment: WrapAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: open ? AppColors.white : AppColors.lowLightBlue,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 10, top: 4),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(
                        text: message.message,
                        size: 18,
                        fontColor: AppColors.highDeepBlue,
                        weight: FontWeight.w400,
                        align: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text: DateFormat('hh:mm a').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              message.timestamp),
                        ),
                        fontColor: AppColors.gray,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        : Wrap(
            alignment: WrapAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  color: AppColors.lowDeepBlue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 20, top: 4),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: message.from,
                        fontColor: AppColors.white,
                        weight: FontWeight.w400,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text: message.message,
                        size: 18,
                        fontColor: AppColors.white,
                        weight: FontWeight.w400,
                        align: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text: DateFormat('hh:mm a').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              message.timestamp),
                        ),
                        align: TextAlign.start,
                        fontColor: AppColors.black,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
  }
}
