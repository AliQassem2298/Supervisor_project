import 'package:project_2tamayoz/models/volunteer_under_supervisor_model.dart';

class SearchVolunteersModel {
  final List<Volunteer> volunteers;

  SearchVolunteersModel({
    required this.volunteers,
  });

  factory SearchVolunteersModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> volunteerData = json['volunteers'];
    List<Volunteer> volunteers = volunteerData
        .map((volunteer) => Volunteer.fromJson(volunteer))
        .toList();
    return SearchVolunteersModel(
      volunteers: volunteers,
    );
  }
}
