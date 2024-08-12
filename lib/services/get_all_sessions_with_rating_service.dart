import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/get_all_sessions_with_rating_model.dart';

class GetAllSessionsWithRatingService {
  Future<GetAllSessionsWithRatingModel> getAllSessionsWithRating() async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/getSessionsWithRatings',
      token: sharedPreferences!.getString("access_token"),
    );
    return GetAllSessionsWithRatingModel.fromJson(data);
  }
}
