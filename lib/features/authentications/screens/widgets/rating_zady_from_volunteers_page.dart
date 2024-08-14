import 'package:flutter/material.dart';
import 'package:project_2tamayoz/models/get_all_sessions_with_rating_model.dart';

class RatingZadyFromVolunteersPage extends StatelessWidget {
  RatingZadyFromVolunteersPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    List<Rating> rating =
        ModalRoute.of(context)!.settings.arguments as List<Rating>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE4C9E5),
        title: const Text(
          'Rating Z.A.D.Y Session',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: rating.length,
          itemBuilder: (context, index) {
            final ratings = rating[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                title: Text(
                  ratings.volunteerName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rating: ${ratings.rating}/5'),
                    SizedBox(height: 8),
                    Text(ratings.comment),
                  ],
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
    home: RatingZadyFromVolunteersPage(),
  ));
}
