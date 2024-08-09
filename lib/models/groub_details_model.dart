class GroupDetailsModel {
  final int status;
  final String message;
  final DataModel dataModel;

  GroupDetailsModel({
    required this.status,
    required this.message,
    required this.dataModel,
  });

  factory GroupDetailsModel.fromJson(Map<String, dynamic> json) {
    return GroupDetailsModel(
      status: json['status'],
      message: json['message'],
      dataModel: DataModel.fromJson(json['data']),
    );
  }
}

class DataModel {
  final int id;
  final String name;
  final int supervisorId;

  DataModel({
    required this.id,
    required this.name,
    required this.supervisorId,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      supervisorId: json['supervisor_id'],
    );
  }
}
