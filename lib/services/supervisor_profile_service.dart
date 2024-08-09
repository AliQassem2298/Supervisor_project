import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/Supervisor_profile_model.dart';

class SupervisorProfileService {
  Future<SupervisorProfileModel> supervisorProfile() async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/Supervisor_profile',
      token: sharedPreferences!.getString("access_token"),
    );
    return SupervisorProfileModel.fromJson(data);
  }
}
