class AddBookModel {
  final String status;
  final String message;
  final BookDataModel data;

  AddBookModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddBookModel.fromJson(Map<String, dynamic> json) {
    return AddBookModel(
      status: json['status'],
      message: json['message'],
      data: BookDataModel.fromJson(json['data']),
    );
  }
}

class BookDataModel {
  final String title;
  final String author;
  final String date;
  final String imageName;
  final String updatedAt;
  final String createdAt;
  final int id;

  BookDataModel({
    required this.title,
    required this.author,
    required this.date,
    required this.imageName,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory BookDataModel.fromJson(Map<String, dynamic> json) {
    return BookDataModel(
      title: json['title'],
      author: json['author'],
      date: json['date'],
      imageName: json['image_name'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }
}
