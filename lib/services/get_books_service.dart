import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/get_books_model.dart';

class GetBooksService {
  Future<GetBooksModel> getBooks() async {
    Map<String, dynamic> data = await Api().get(
      url: '$baseUrl/getBooks',
      token: sharedPreferences!.getString("access_token"),
    );
    return GetBooksModel.fromJson(data);
  }
}
