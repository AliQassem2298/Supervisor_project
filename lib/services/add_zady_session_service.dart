import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/add_zady_session_model.dart';

class AddZadySessionService {
  Future<AddZadySessionModel> addZadySession({
    required int bookId,
    required String sessionDate,
    required String duration,
    required String sessionHours,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/addZadiSession',
      body: {
        "book_id": bookId,
        "session_date": sessionDate,
        "duration": duration,
        "session_hours": sessionHours
      },
      token: sharedPreferences!.getString("access_token"),
    );
    return AddZadySessionModel.fromJson(data);
  }
}
