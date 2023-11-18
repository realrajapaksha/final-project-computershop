import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../models/data_models/message_model.dart';
import '../../../../utils/shared_values.dart';

class ChatController extends GetxController {
  final db = FirebaseFirestore.instance;

  final messageList = <MessageModel>[].obs;

  final message = TextEditingController();

  final email = SharedValues.shared.email.obs;

  final admin = SharedValues.shared.type.obs;

  String assignEmail = "";

  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>> listener;

  chatListen(String? fromMail) async {
    try {
      if (fromMail != null) {
        email.value = fromMail;
        assignEmail = fromMail;
      }else{
        assignEmail = SharedValues.shared.email;
      }

      listener = db
          .collection("chats")
          .where("assignEmail", isEqualTo: email.value)
          .snapshots()
          .listen((event) {
        for (var change in event.docChanges) {
          switch (change.type) {
            case DocumentChangeType.added:
              final message = MessageModel(
                  id: change.doc.id,
                  message: change.doc.data()?["message"],
                  timestamp: change.doc.data()?["timestamp"],
                  from: change.doc.data()?["from"],
                  fromType: change.doc.data()?["fromType"],
                  assignEmail: change.doc.data()?["assignEmail"]);
              bool res = messageList.contains(message);
              if (!res) {
                messageList.add(message);
              }
              messageList.sort((b, a) => a.timestamp.compareTo(b.timestamp));
              break;
            case DocumentChangeType.modified:
              break;
            case DocumentChangeType.removed:
              messageList.removeWhere((element) => element.id == change.doc.id);
              messageList.sort((b, a) => a.timestamp.compareTo(b.timestamp));
              break;
          }
        }
      });
    } catch (exception) {
      //
    }
  }

  sendMessage() async {
    String msg = message.text.trim();
    message.clear();
    try {

      final newMessage = MessageModel(
          id: "",
          message: msg,
          timestamp: Timestamp.now().millisecondsSinceEpoch,
          from: SharedValues.shared.username,
          fromType: SharedValues.shared.type,
          assignEmail: assignEmail);

      await db
          .collection("chats")
          .add(newMessage.toAddFireStore())
          .then((value) {
        message.clear();
      }).onError((error, stackTrace) {
        message.text = msg;
      });
    } catch (exception) {
      message.text = msg;
    }
  }

  // deleteMassage(String id) async {
  //   try {
  //     if (id.isEmpty) {
  //       return;
  //     }
  //     await db
  //         .collection("chats")
  //         .doc(event.id.trim())
  //         .collection(agenda.id.trim())
  //         .doc(id)
  //         .delete();
  //   } catch (exception) {
  //     //
  //   }
  // }
}
