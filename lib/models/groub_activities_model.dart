class GroupActivitiesModel {
  final int status;
  final String message;
  final List<dynamic> data;

  GroupActivitiesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GroupActivitiesModel.fromJson(Map<String, dynamic> json) {
    return GroupActivitiesModel(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}
