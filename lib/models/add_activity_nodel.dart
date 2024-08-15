class AddActivityNodel {
  final String message;
  final int status;
  AddActivityNodel({
    required this.message,
    required this.status,
  });
  factory AddActivityNodel.fromJson(Map<String, dynamic> json) {
    return AddActivityNodel(
      message: json['message'],
      status: json['status'],
    );
  }
}
