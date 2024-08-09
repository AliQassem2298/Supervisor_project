import 'package:flutter/material.dart';

import '../../modules/notification.dart';

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
  List<NotificationItemData> notifications = [
    NotificationItemData(
      userImage: 'assets/images/download33.jpeg',
      userName: 'leen',
      action: 'Liked your image',
      time: '2 h ago',
    ),
    NotificationItemData(
      userImage: 'assets/images/download33.jpeg',
      userName: 'Alia',
      action: 'Liked your comment',
      time: '6 h ago',
    ),
    NotificationItemData(
      userImage: 'assets/images/download33.jpeg',
      userName: 'Johny vino',
      action: 'Mentioned you in a comment',
      time: '8 h ago',
    ),
    NotificationItemData(
      userImage: 'assets/images/download33.jpeg',
      userName: 'Bana',
      action: 'Liked your photo',
      time: '6 June',
    ),
    NotificationItemData(
      userImage: 'assets/images/download33.jpeg',
      userName: 'solaf',
      action: 'Started following Your work',
      time: '5 June',
    ),
    NotificationItemData(
      userImage: 'assets/images/download33.jpeg',
      userName: 'Kamar',
      action: 'Mentioned you in a comment',
      time: '5 June',
    ),
  ];

  void clearAllNotifications() {
    setState(() {
      notifications.clear();
    });
  }

  void removeNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  void showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f5fa),
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              showConfirmationDialog(
                context: context,
                title: 'Clear All Notifications',
                content: 'Are you sure you want to clear all notifications?',
                onConfirm: clearAllNotifications,
              );
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
              'You have ${notifications.length} Notifications today.',
              style: TextStyle(color: Color(0xffFEB06A), fontSize: 16),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return NotificationItem(
                    userImage: notification.userImage,
                    userName: notification.userName,
                    action: notification.action,
                    time: notification.time,
                    onDelete: () {
                      showConfirmationDialog(
                        context: context,
                        title: 'Delete Notification',
                        content:
                            'Are you sure you want to delete this notification?',
                        onConfirm: () => removeNotification(index),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
