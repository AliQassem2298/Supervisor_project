class MassageModel {
  final String message;
  MassageModel({
    required this.message,
  });
  factory MassageModel.fromJson(Map<String, dynamic> json) {
    return MassageModel(message: json['message']);
  }
}
