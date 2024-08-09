import 'package:project_2tamayoz/models/supervisor_data_model.dart';

class SupervisorProfileModel {
  final int status;
  final String message;
  final SupervisorDataModel supervisorDataModel;

  SupervisorProfileModel({
    required this.status,
    required this.message,
    required this.supervisorDataModel,
  });

  factory SupervisorProfileModel.fromJson(Map<String, dynamic> json) {
    return SupervisorProfileModel(
      status: json['status'],
      message: json['message'],
      supervisorDataModel: SupervisorDataModel.fromJson(json['data']),
    );
  }
}
