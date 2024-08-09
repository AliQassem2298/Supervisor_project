class SupervisorDataModel {
  final int id;
  final String nameSupervisor;
  final String email;
  final String gender;
  final String mobilePhone;
  final String address;
  final String nationality;
  final String birthDate;
  final String role;

  SupervisorDataModel({
    required this.id,
    required this.nameSupervisor,
    required this.email,
    required this.gender,
    required this.mobilePhone,
    required this.address,
    required this.nationality,
    required this.birthDate,
    required this.role,
  });

  factory SupervisorDataModel.fromJson(Map<String, dynamic> json) {
    return SupervisorDataModel(
      id: json['id'],
      nameSupervisor: json['name_supervisor'],
      email: json['email'],
      gender: json['gender'],
      mobilePhone: json['mobile_phone'],
      address: json['address'],
      nationality: json['nationality'],
      birthDate: json['birth_date'],
      role: json['role'],
    );
  }
}
