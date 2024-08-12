import 'package:flutter/material.dart';

class VolunteerRating {
  final String volunteerName;
  final int rating;
  final String comment;

  VolunteerRating({
    required this.volunteerName,
    required this.rating,
    required this.comment,
  });
}

class RatingZadyFromVolunteersPage extends StatelessWidget {
  const RatingZadyFromVolunteersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the list
    final List<VolunteerRating> ratings = [
      VolunteerRating(
        volunteerName: 'John Doe',
        rating: 4,
        comment: 'Great session, very informative!',
      ),
      VolunteerRating(
        volunteerName: 'Jane Smith',
        rating: 5,
        comment: 'Loved the discussion, looking forward to more!',
      ),
      VolunteerRating(
        volunteerName: 'Alice Johnson',
        rating: 3,
        comment: 'It was okay, but could be better.',
      ),
      // Add more ratings as needed
    ];

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
          itemCount: ratings.length,
          itemBuilder: (context, index) {
            final rating = ratings[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                title: Text(
                  rating.volunteerName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rating: ${rating.rating}/5'),
                    SizedBox(height: 8),
                    Text(rating.comment),
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
