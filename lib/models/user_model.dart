import 'package:project_2tamayoz/main.dart';

class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String? emailVerifiedAt;
  final String gender;
  final String mobilePhone;
  final String address;
  final String nationality;
  final String birthDate;
  final int roleId;
  final String? code;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerifiedAt,
    required this.gender,
    required this.mobilePhone,
    required this.address,
    required this.nationality,
    required this.birthDate,
    required this.roleId,
    required this.code,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(json) {
    sharedPreferences!.setInt("id", json['id']);
    sharedPreferences!.setString("first_name", json['first_name']);
    sharedPreferences!.setString("last_name", json['last_name']);
    sharedPreferences!.setString("email", json['email']);
    sharedPreferences!.setString("mobile_phone", json['mobile_phone']);

    return UserModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      gender: json['gender'],
      mobilePhone: json['mobile_phone'],
      address: json['address'],
      nationality: json['nationality'],
      birthDate: json['birth_date'],
      roleId: json['role_id'],
      code: json['code'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
