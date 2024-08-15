import 'package:flutter/material.dart';
import 'package:project_2tamayoz/models/notifications_model.dart';
import 'package:project_2tamayoz/services/notifications_service.dart';

/*class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Color(0xffE4C9E5),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You have 3 Notifications today.',
              style: TextStyle(color: Color(0xff36D6E7), fontSize: 16),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  NotificationItem(
                    userImage: 'assets/user1.png',
                    userName: 'leen',
                    action: 'Liked your image',
                    time: '2 h ago',
                  ),
                  NotificationItem(
                    userImage: 'assets/user2.png',
                    userName: 'Alia',
                    action: 'Liked your comment',
                    time: '6 h ago',
                  ),
                  NotificationItem(
                    userImage: 'assets/user3.png',
                    userName: 'Johny vino',
                    action: 'Mentioned you in a comment',
                    time: '8 h ago',
                  ),
                  SizedBox(height: 20),
                  Text(
                    'This Week',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xffFEB06A)),
                  ),
                  NotificationItem(
                    userImage: 'assets/user4.png',
                    userName: 'Bana',

                    action: 'Liked your photo',
                    time: '6 June',

                  ),
                  NotificationItem(
                    userImage: 'assets/user5.png',
                    userName: 'solaf',
                    action: 'Started following Your work',
                    time: '5 June',
                  ),
                  NotificationItem(
                    userImage: 'assets/user6.png',
                    userName: 'Kamar',
                    action: 'Mentioned you in a comment',
                    time: '5 June',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NotificationsModel>(
      future: NotificationsService().notifications(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
          return const Center(
            child: Text('No notifications available.'),
          );
        } else {
          NotificationsModel notificationsModel = snapshot.data!;
          return ListView.builder(
            itemCount: notificationsModel.data.length,
            itemBuilder: (context, index) {
              NotificationData notification = notificationsModel.data[index];
              return Card(
                child: ListTile(
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: notification.text, // Accessing the 'text' field
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const TextSpan(
                          text: ' - ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: notification.type, // Accessing the 'type' field
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
