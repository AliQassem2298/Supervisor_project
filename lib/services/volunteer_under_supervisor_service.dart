import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/volunteer_under_supervisor_model.dart';

class VolunteerUnderSupervisorService {
  Future<VolunteerUnderSupervisorModel> volunteerUnderSupervisor({
    required int id,
  }) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/volunteers_under_supervisor/$id',
      token: sharedPreferences!.getString("access_token"),
    );

    return VolunteerUnderSupervisorModel.fromJson(data);
  }
}
