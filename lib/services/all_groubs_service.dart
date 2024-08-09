import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/all_groub_model.dart';

class AllGroubsService {
  Future<List<GroupModel>> allGroubs({
    required int userId,
  }) async {
    List<dynamic> data = await Api().get(
      url: '$baseUrl/all_groups/$userId',
      token: sharedPreferences!.getString("access_token"),
    );
    return data.map((item) => GroupModel.fromJson(item)).toList();
  }
}
