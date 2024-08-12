import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/add_book_model.dart';

class AddBookService {
  Future<AddBookModel> addBook({
    required String title,
    required String author,
    required String date,
    required String imageName,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/addBook',
      body: {
        "title": title,
        "author": author,
        "date": date,
        "image_name": imageName,
      },
      token: sharedPreferences!.getString("access_token"),
    );
    return AddBookModel.fromJson(data);
  }
}
