import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2tamayoz/features/authentications/screens/widgets/rating_zady_from_volunteers_page.dart';

class ZadySession {
  final String bookName;
  final String bookImage;
  final String sessionDate;
  final int averageRating;
  final String ratingMessage;

  ZadySession({
    required this.bookName,
    required this.bookImage,
    required this.sessionDate,
    required this.averageRating,
    required this.ratingMessage,
  });
}

class ViewZadySessionPage extends StatelessWidget {
  const ViewZadySessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the list
    final List<ZadySession> sessions = [
      ZadySession(
        bookName: 'Book One',
        bookImage: 'assets/images/download33.jpeg',
        sessionDate: '2024-08-10 10:00:00',
        averageRating: 4,
        ratingMessage: 'Great session!',
      ),
      ZadySession(
        bookName: 'Book Two',
        bookImage: 'assets/images/download33.jpeg',
        sessionDate: '2024-08-12 14:30:00',
        averageRating: 5,
        ratingMessage: 'Excellent discussion!',
      ),
      // Add more sessions as needed
    ];

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
        child: ListView.builder(
          itemCount: sessions.length,
          itemBuilder: (context, index) {
            final session = sessions[index];
            return Card(
              margin: EdgeInsets.only(bottom: 16),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RatingZadyFromVolunteersPage()),
                  );
                },
                child: ListTile(
                  leading: Image.asset(
                    session.bookImage,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
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
