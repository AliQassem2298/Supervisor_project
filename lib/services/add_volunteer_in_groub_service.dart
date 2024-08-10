import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/message_mode.dart';

class AddVolunteerInGroubService {
  Future<MassageModel> addVolunteerInGroub({
    required int userId,
    required int groupId,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/add_volunteer_to_group',
      body: {
        "user_id": userId,
        "group_id": groupId,
      },
      token: sharedPreferences!.getString("access_token"),
    );
    return MassageModel.fromJson(data);
  }
}
