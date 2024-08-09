class VolunteerUnderSupervisorModel {
  final String message;
  final List<Volunteer> volunteers;

  VolunteerUnderSupervisorModel({
    required this.message,
    required this.volunteers,
  });

  factory VolunteerUnderSupervisorModel.fromJson(Map<String, dynamic> json) {
    var volunteersList = json['volunteers'] as List;
    List<Volunteer> volunteers =
        volunteersList.map((i) => Volunteer.fromJson(i)).toList();

    return VolunteerUnderSupervisorModel(
      message: json['message'],
      volunteers: volunteers,
    );
  }
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String mobilePhone;
  final String address;
  final String nationality;
  final String birthDate;
  final int roleId;
  final String? emailVerifiedAt;
  final String? code;
  final String? createdAt;
  final String? updatedAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.mobilePhone,
    required this.address,
    required this.nationality,
    required this.birthDate,
    required this.roleId,
    this.emailVerifiedAt,
    this.code,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      gender: json['gender'],
      mobilePhone: json['mobile_phone'],
      address: json['address'],
      nationality: json['nationality'],
      birthDate: json['birth_date'],
      roleId: json['role_id'],
      emailVerifiedAt: json['email_verified_at'],
      code: json['code'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Volunteer {
  final int id;
  final int userId;
  final int groupId;
  final int supervisorId;
  final User user;
  final String? createdAt;
  final String? updatedAt;

  Volunteer({
    required this.id,
    required this.userId,
    required this.groupId,
    required this.supervisorId,
    required this.user,
    this.createdAt,
    this.updatedAt,
  });

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
      id: json['id'],
      userId: json['user_id'],
      groupId: json['group_id'],
      supervisorId: json['supervisor_id'],
      user: User.fromJson(json['user']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
