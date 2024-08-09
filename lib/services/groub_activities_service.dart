import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/groub_activities_model.dart';

class GroubActivitiesService {
  Future<GroupActivitiesModel> groupActivities({
    required int groupId,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/group_activities',
      body: {
        "group_id": groupId,
      },
      token: sharedPreferences!.getString("access_token"),
    );
    return GroupActivitiesModel.fromJson(data);
  }
}
