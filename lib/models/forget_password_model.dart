class ForgetPasswordModel {
  final String status;
  final String message;

  ForgetPasswordModel({
    required this.status,
    required this.message,
  });

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
