import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/get_groub_activities_model.dart';

class GroubActivitiesService {
  Future<GetGroubActivitesModel> groupActivities({
    required int groupId,
  }) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/group/$groupId/activities',
      token: sharedPreferences!.getString("access_token"),
    );
    return GetGroubActivitesModel.fromJson(data);
  }
}
