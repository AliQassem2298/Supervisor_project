import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/add_activity_nodel.dart';

class AddActivityService {
  Future<AddActivityNodel> addActivity({
    required String name,
    required String description,
    required String startTime,
    required String endTime,
    required List<Map<String, dynamic>> volunteers,
  }) async {
    Map<String, dynamic> body = {
      'name': name,
      'description': description,
      'start_time': startTime,
      'end_time': endTime,
      'volunteers': volunteers,
    };

    // Make the POST request
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/add_activities',
      body: body,
      token: sharedPreferences!.getString("access_token"),
    );

    return AddActivityNodel.fromJson(data);
  }
}
