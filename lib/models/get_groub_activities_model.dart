class GetGroubActivitesModel {
  final int status;
  final List<GroupActivity> data;

  GetGroubActivitesModel({required this.status, required this.data});

  factory GetGroubActivitesModel.fromJson(Map<String, dynamic> json) {
    return GetGroubActivitesModel(
      status: json['status'],
      data: List<GroupActivity>.from(
          json['data'].map((x) => GroupActivity.fromJson(x))),
    );
  }
}

class GroupActivity {
  final int id;
  final String name;
  final List<Volunteer> volunteers;

  GroupActivity(
      {required this.id, required this.name, required this.volunteers});

  factory GroupActivity.fromJson(Map<String, dynamic> json) {
    return GroupActivity(
      id: json['id'],
      name: json['name'],
      volunteers: List<Volunteer>.from(
          json['volunteers'].map((x) => Volunteer.fromJson(x))),
    );
  }
}

class Volunteer {
  final int id;
  final String firstName;
  final String lastName;

  Volunteer(
      {required this.id, required this.firstName, required this.lastName});

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }
}
