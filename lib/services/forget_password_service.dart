// ignore_for_file: missing_required_param

import 'package:project_2tamayoz/helper/api.dart';
import 'package:project_2tamayoz/models/forget_password_model.dart';

class ForgetPasswordService {
  Future<ForgetPasswordModel> login({
    required String email,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/forget_password',
      body: {
        'email': email,
      },
    );

    return ForgetPasswordModel.fromJson(data);
  }
}
