class VolunteerReportModel {
  final ReportData reportData;

  VolunteerReportModel({
    required this.reportData,
  });

  factory VolunteerReportModel.fromJson(Map<String, dynamic> json) {
    return VolunteerReportModel(
      reportData: ReportData.fromJson(json['report']),
    );
  }
}

class ReportData {
  final int id;
  final int volunteerId;
  final String description;
  final String createdAt;
  final String updatedAt;

  ReportData({
    required this.id,
    required this.volunteerId,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReportData.fromJson(Map<String, dynamic> json) {
    return ReportData(
      id: json['id'],
      volunteerId: json['volunteer_id'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
