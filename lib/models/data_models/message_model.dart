class MessageModel {
  final String id;
  final String from;
  final String fromType;
  final String message;
  final int timestamp;
  final String assignEmail;

  const MessageModel(
      {required this.id,
        required this.from,
        required this.fromType,
        required this.message,
        required this.timestamp,
        required this.assignEmail});

  Map<String, dynamic> toAddFireStore() {
    return {
      "from": from,
      "fromType": fromType,
      "message": message,
      "timestamp": timestamp,
      "assignEmail": assignEmail,
    };
  }
}
