import 'package:project_2tamayoz/models/add_book_model.dart';

class GetBooksModel {
  final String status;
  final String message;
  final List<BookDataModel> data;

  GetBooksModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetBooksModel.fromJson(Map<String, dynamic> json) {
    return GetBooksModel(
      status: json['status'],
      message: json['message'],
      data: List<BookDataModel>.from(
          json['data'].map((item) => BookDataModel.fromJson(item))),
    );
  }
}
