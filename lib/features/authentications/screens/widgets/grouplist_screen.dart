import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_2tamayoz/features/authentications/screens/widgets/search_page.dart';
import 'package:project_2tamayoz/features/authentications/screens/widgets/view_books_page.dart';
import 'package:project_2tamayoz/features/authentications/screens/widgets/view_zady_session_page.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/get_groub_id_model.dart';
import 'package:project_2tamayoz/services/get_groub_id_service.dart';
import 'package:project_2tamayoz/services/notifications_service.dart';
import 'leaderprofilepage.dart';
import 'members_screen.dart';
import 'activity_list_screen.dart';
import 'notification_page.dart';
import 'settings_page.dart';
import 'chat_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GroupListScreen(),
    );
  }
}

class GroupListScreen extends StatefulWidget {
  const GroupListScreen({Key? key}) : super(key: key);

  @override
  _GroupListScreenState createState() => _GroupListScreenState();
}

class _GroupListScreenState extends State<GroupListScreen> {
  int _selectedIndex = 0;

  List<Widget> _screens = [
    GroupListContent(),
    SearchPage(),
    SupervisorProfilePage(supervisor: 'Hiba Omar'),
    // ReportPage(),
    NotificationPage(),
    ChatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f5fa),
      appBar: _selectedIndex == 0
          ? AppBar(
              backgroundColor: Color(0xffE4C9E5),
              leading: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'Settings') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  } else if (value == 'book') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewBooksPage()),
                    );
                  } else if (value == 'ZADY') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewZadySessionPage()),
                    );
                  }
                },
                icon: const Icon(Icons.menu, size: 30, color: Colors.white),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'Settings',
                    child: Row(
                      children: [
                        Icon(Icons.settings, color: Colors.black),
                        SizedBox(width: 8),
                        Text('Settings'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'book',
                    child: Row(
                      children: [
                        Icon(Icons.bookmark_add_rounded, color: Colors.black),
                        SizedBox(width: 8),
                        Text('Books'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'ZADY',
                    child: Row(
                      children: [
                        Icon(Icons.edit_calendar_outlined, color: Colors.black),
                        SizedBox(width: 8),
                        Text('Z.A.D.Y'),
                      ],
                    ),
                  ),
                ],
              ),
              title: Center(
                child: const Text(
                  'My Group',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              actions: [
                Center(
                    child: Icon(Icons.groups, size: 38, color: Colors.white)),
                IconButton(
                  onPressed: () {
                    sharedPreferences!.clear();
                    print(
                      sharedPreferences!.getString("access_token"),
                    );
                  },
                  icon: const Icon(Icons.heart_broken),
                ),
                IconButton(
                  onPressed: () async {
                    // await AddActivityService().addActivity(
                    //   name: "ahmed mohsen",
                    //   description: "beo beoooo",
                    //   startTime: "2024-08-20 10:00:00",
                    //   endTime: "2024-08-20 12:00:00",
                    //   volunteers: [
                    //     {
                    //       'id': 1,
                    //       'first_name': 'asd',
                    //       'last_name': 'asd',
                    //     },
                    //   ],
                    // );
                    await NotificationsService().notifications();
                  },
                  icon: const Icon(Icons.local_convenience_store),
                ),
              ],
            )
          : null,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        backgroundColor: Color(0xffE4C9E5),
        color: Color(0xff4d4c4c),
        activeColor: Colors.white,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.person_outlined, title: 'Profile'),
          // TabItem(icon: Icons.edit_note, title: 'Reports'),
          TabItem(icon: Icons.notifications, title: 'Noti'),
          TabItem(icon: Icons.message, title: 'Chats'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class GroupListContent extends StatelessWidget {
  const GroupListContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetGroubIdModel>(
      future: GetGroubIdService().groubDetails(
        userId: sharedPreferences!.getInt("id")!,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'No Groub for this supervisor.',
              style: const TextStyle(),
            ),
          );
        } else {
          GetGroubIdModel groub = snapshot.data!;
          return ListView(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ActivityListScreen(
                        group: groub,
                      ),
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              groub.groupName,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            Text(
                              'Supervisor: ${sharedPreferences!.getString("first_name")} ${sharedPreferences!.getString("last_name")}',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff36D6E7)),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.add,
                              color: Color(0xffFEB06A), size: 30),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return MembersPage(
                                  getGroubIdModel: groub,
                                );
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
