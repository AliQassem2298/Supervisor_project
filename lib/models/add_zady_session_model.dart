class AddZadySessionModel {
  final String status;
  final String message;
  final ZadySessionData data;

  AddZadySessionModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddZadySessionModel.fromJson(Map<String, dynamic> json) {
    return AddZadySessionModel(
      status: json['status'],
      message: json['message'],
      data: ZadySessionData.fromJson(json['data']),
    );
  }
}

class ZadySessionData {
  final int bookId;
  final String sessionDate;
  final String duration;
  final String sessionHours;
  final String updatedAt;
  final String createdAt;
  final int id;

  ZadySessionData({
    required this.bookId,
    required this.sessionDate,
    required this.duration,
    required this.sessionHours,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory ZadySessionData.fromJson(Map<String, dynamic> json) {
    return ZadySessionData(
      bookId: json['book_id'],
      sessionDate: json['session_date'],
      duration: json['duration'],
      sessionHours: json['session_hours'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }
}
