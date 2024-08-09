import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/groub_details_model.dart';

class GroubDetailsService {
  Future<GroupDetailsModel> groubDetails({
    required int groubId,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/group-details',
      body: {
        "group_id": groubId,
      },
      token: sharedPreferences!.getString("access_token"),
    );
    return GroupDetailsModel.fromJson(data);
  }
}
