class NotificationsModel {
  final int status;
  final String message;
  final List<NotificationData> data;

  NotificationsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List)
              .map((item) => NotificationData.fromJson(item))
              .toList()
          : [],
    );
  }
}

class NotificationData {
  final int id;
  final String text;
  final String type;

  NotificationData({
    required this.id,
    required this.text,
    required this.type,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json['id'],
      text: json['text'],
      type: json['type'],
    );
  }
}
