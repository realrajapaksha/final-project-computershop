class AIResultModel {
  final String response;

  const AIResultModel({required this.response});

  factory AIResultModel.fromJson(Map<String, dynamic> json) => AIResultModel(
        response: json["response"],
      );
}
