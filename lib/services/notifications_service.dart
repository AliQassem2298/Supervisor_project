import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/notifications_model.dart';

class NotificationsService {
  Future<NotificationsModel> notifications() async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/my_notifications',
      token: sharedPreferences!.getString("access_token"),
    );
    return NotificationsModel.fromJson(data);
  }
}
