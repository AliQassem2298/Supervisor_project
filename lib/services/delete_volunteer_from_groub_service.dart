import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/message_mode.dart';

class DeleteVolunteerFromGroubService {
  Future<MassageModel> deleteVolunteerFromGroub({required int id}) async {
    Map<String, dynamic> data = await Api().delete(
      url: '$baseUrl/remove_volunteer_from_group/$id',
      token: sharedPreferences!.getString("access_token"),
    );
    return MassageModel.fromJson(data);
  }
}
