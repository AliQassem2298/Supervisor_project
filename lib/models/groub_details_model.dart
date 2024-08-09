class GetGroubIdModel {
  final int groupId;
  final String groupName;
  final int supervisorId;

  GetGroubIdModel({
    required this.groupId,
    required this.groupName,
    required this.supervisorId,
  });

  factory GetGroubIdModel.fromJson(Map<String, dynamic> json) {
    return GetGroubIdModel(
      groupId: json['group_id'],
      groupName: json['group_name'],
      supervisorId: json['supervisor_id'],
    );
  }
}
