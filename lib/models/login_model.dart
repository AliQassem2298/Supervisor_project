import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/user_model.dart';

class LoginModel {
  final String status;
  final String message;
  final String accessToken;
  final UserModel userDataModel;
  final String role;

  LoginModel({
    required this.status,
    required this.message,
    required this.accessToken,
    required this.userDataModel,
    required this.role,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    sharedPreferences!.setString("access_token", json['access_token']);

    return LoginModel(
      status: json['status'],
      message: json['message'],
      accessToken: json['access_token'],
      userDataModel: UserModel.fromJson(json['data']),
      role: json['role'],
    );
  }
}
