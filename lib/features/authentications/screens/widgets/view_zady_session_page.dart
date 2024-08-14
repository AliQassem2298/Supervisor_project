import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2tamayoz/features/authentications/screens/widgets/rating_zady_from_volunteers_page.dart';
import 'package:project_2tamayoz/models/get_all_sessions_with_rating_model.dart';
import 'package:project_2tamayoz/services/get_all_sessions_with_rating_service.dart';

class ViewZadySessionPage extends StatelessWidget {
  const ViewZadySessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE4C9E5),
        title: const Text(
          'Z.A.D.Y Sessions',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<GetAllSessionsWithRatingModel>(
          future: GetAllSessionsWithRatingService().getAllSessionsWithRating(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('There Is No Z.A.D.Y Sessions.'),
                //  child: Text(snapshot.error.toString()),
              );
            } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
              return const Center(
                child: Text('There Is No Z.A.D.Y Sessions.'),
              );
            } else {
              GetAllSessionsWithRatingModel getAllSessionsWithRatingModel =
                  snapshot.data!;
              return ListView.builder(
                itemCount: getAllSessionsWithRatingModel.data.length,
                itemBuilder: (context, index) {
                  final session = getAllSessionsWithRatingModel.data[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 16),
                    child: InkWell(
                      onTap: () {
                        getAllSessionsWithRatingModel
                                .data[index].ratings!.isNotEmpty
                            ? Get.to(() => RatingZadyFromVolunteersPage(),
                                arguments: getAllSessionsWithRatingModel
                                    .data[index].ratings)
                            : Container();
                      },
                      child: ListTile(
                        leading: getAllSessionsWithRatingModel
                                .data[index].bookImage.isNotEmpty
                            ? getAllSessionsWithRatingModel
                                    .data[index].bookImage
                                    .startsWith('http')
                                ? Image.network(
                                    getAllSessionsWithRatingModel
                                        .data[index].bookImage,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(getAllSessionsWithRatingModel
                                        .data[index].bookImage),
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )
                            : Icon(Icons.book,
                                size: 50), // Default icon if no image
                        title: Text(session.bookName),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Session Date: ${session.sessionDate}'),
                            Text('Average Rating: ${session.averageRating}/5'),
                            Text('Rating: ${session.ratingMessage}'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ViewZadySessionPage(),
  ));
}
