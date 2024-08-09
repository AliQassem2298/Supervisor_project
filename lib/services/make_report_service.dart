import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/message_mode.dart';

class MakeReportService {
  Future<MassageModel> makeReport({
    required int volunteerId,
    required String description,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/supervisors_reports',
      body: {
        "volunteer_id": volunteerId,
        "description": description,
      },
      token: sharedPreferences!.getString("access_token"),
    );

    return MassageModel.fromJson(data);
  }
}
