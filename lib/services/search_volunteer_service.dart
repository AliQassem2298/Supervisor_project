import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/search_volunteer_model.dart';

class SearchVolunteerService {
  Future<SearchVolunteersModel> searchVolunteer({
    required int id,
    required String searchQuery,
  }) async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/search_volunteers/$id/$searchQuery',
      token: sharedPreferences!.getString("access_token"),
    );
    return SearchVolunteersModel.fromJson(data);
  }
}
