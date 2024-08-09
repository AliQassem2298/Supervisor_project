import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/volunteer_under_supervisor_model.dart';

class AllVolunteersService {
  Future<List<Volunteer>> allVolunteers({
    required int userId,
  }) async {
    List<dynamic> data = await Api().get(
      url: '$baseUrl/all_volunteers/$userId',
      token: sharedPreferences!.getString("access_token"),
    );
    return data.map((item) => Volunteer.fromJson(item)).toList();
  }
}
