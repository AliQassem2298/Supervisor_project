// ignore_for_file: missing_required_param

import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/models/login_model.dart';

class LoginService {
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/log_in',
      body: {
        'email': email,
        'password': password,
      },
    );

    return LoginModel.fromJson(data);
  }
}
