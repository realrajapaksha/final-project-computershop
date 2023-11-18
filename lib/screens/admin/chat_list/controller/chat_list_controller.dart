import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatListModel {
  final String name;
  final String email;
  final String image;

  const ChatListModel(
      {required this.name, required this.email, required this.image});
}

class ChatListController extends GetxController {
  final db = FirebaseFirestore.instance;

  final chatList = <ChatListModel>[].obs;

  final loading = false.obs;

  getChatList() async {
    try {
      loading.value = true;
      chatList.clear();
      await db.collection("chats").get().then((value) async {
        final list = Set<String>();
        for (var item in value.docs) {
          if (list.add(item["assignEmail"])) {
            await db
                .collection("users")
                .doc(item["assignEmail"])
                .get()
                .then((res) {
              if (res.exists) {
                String imgUrl = res["image"];
                if (res["image"] == "null") {
                  imgUrl =
                      "https://firebasestorage.googleapis.com/v0/b/nanotek-esoft.appspot.com/o/download.jpg?alt=media&token=a805e081-fe36-47a0-85c4-4a7deae811d2";
                }
                chatList.add(ChatListModel(
                    name: item["from"],
                    email: item["assignEmail"],
                    image: imgUrl));
              }
            });
          }
        }
      });
      loading.value = false;
    } catch (exception) {
      loading.value = false;
    }
  }
}
