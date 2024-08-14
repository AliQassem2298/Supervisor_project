class GetAllSessionsWithRatingModel {
  final String status;
  final String message;
  final List<SessionData> data;

  GetAllSessionsWithRatingModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllSessionsWithRatingModel.fromJson(Map<String, dynamic> json) {
    return GetAllSessionsWithRatingModel(
        status: json['status'],
        message: json['message'],
        data: List<SessionData>.from(
            json['data'].map((item) => SessionData.fromJson(item))));
  }
}

class SessionData {
  final int sessionId;
  final String bookName;
  final String bookImage;
  final String sessionDate;
  final int averageRating;
  final String ratingMessage;
  final List<Rating>? ratings;

  SessionData({
    required this.sessionId,
    required this.bookName,
    required this.bookImage,
    required this.sessionDate,
    required this.averageRating,
    required this.ratingMessage,
    this.ratings,
  });

  factory SessionData.fromJson(Map<String, dynamic> json) {
    return SessionData(
      sessionId: json['session_id'],
      bookName: json['book_name'],
      bookImage: json['book_image'],
      sessionDate: json['session_date'],
      averageRating: json['average_rating'],
      ratingMessage: json['rating_message'],
      ratings: json['ratings'] != null
          ? List<Rating>.from(
              json['ratings'].map((item) => Rating.fromJson(item)))
          : null,
    );
  }
}

class Rating {
  final String volunteerName;
  final int rating;
  final String comment;

  Rating({
    required this.volunteerName,
    required this.rating,
    required this.comment,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      volunteerName: json['volunteer_name'],
      rating: json['rating'],
      comment: json['comment'],
    );
  }
}
