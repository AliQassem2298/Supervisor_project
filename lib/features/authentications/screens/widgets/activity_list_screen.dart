import 'package:flutter/material.dart';
import 'package:project_2tamayoz/features/authentications/screens/widgets/add_activity_page.dart';
import 'package:project_2tamayoz/models/get_groub_activities_model.dart';
import 'package:project_2tamayoz/models/get_groub_id_model.dart';
import 'package:project_2tamayoz/services/groub_activities_service.dart';

class ActivityListScreen extends StatefulWidget {
  final GetGroubIdModel group;

  ActivityListScreen({Key? key, required this.group}) : super(key: key);

  @override
  _ActivityListScreenState createState() => _ActivityListScreenState();
}

class _ActivityListScreenState extends State<ActivityListScreen> {
  Future<void> _refreshActivities() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f5fa),
      appBar: AppBar(
        backgroundColor: const Color(0xffE4C9E5),
        title: Text(
          widget.group.groupName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepOrangeAccent[500],
          ),
        ),
      ),
      body: FutureBuilder<GetGroubActivitesModel>(
        future: GroubActivitiesService().groupActivities(
          groupId: widget.group.groupId,
        ),
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
              child: Text('There Is No Activities.'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.data.length,
              itemBuilder: (context, index) {
                final activity = snapshot.data!.data[index];

                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(activity.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Volunteers:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        ...activity.volunteers.map((volunteer) {
                          return Text(
                            '${volunteer.firstName} ${volunteer.lastName}',
                            style: const TextStyle(color: Color(0xff36D6E7)),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddActivityPage(
                onActivityAdded: _refreshActivities,
              ),
            ),
          );
        },
        tooltip: 'Add Activity',
        child: const Icon(Icons.add),
      ),
    );
  }
}
