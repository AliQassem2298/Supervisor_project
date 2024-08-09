import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/volunteer_report_model.dart';

class VolunteerReportService {
  Future<VolunteerReportModel> volunteerReport({
    required int userId,
  }) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/volunteers/report/$userId',
      token: sharedPreferences!.getString("access_token"),
    );
    return VolunteerReportModel.fromJson(data);
  }
}
