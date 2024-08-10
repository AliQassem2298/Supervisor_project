import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/get_groub_id_model.dart';

class GetGroubIdService {
  Future<GetGroubIdModel> groubDetails({
    required int userId,
  }) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/supervisor_group/$userId',
      token: sharedPreferences!.getString("access_token"),
    );
    return GetGroubIdModel.fromJson(data);
  }
}
