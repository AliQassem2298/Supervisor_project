import 'package:flutter/material.dart';
import '../../modules/group_with_members.dart';


class ActivityListScreen extends StatelessWidget {

  final GroupWithMembers group;


  const ActivityListScreen({Key? key, required this.group}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xfff8f5fa),
      appBar: AppBar(
        backgroundColor: Color(0xffE4C9E5),
        title: Text(group.name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrangeAccent[500]),),
      ),
      body: ListView.builder(
        itemCount: group.activities.length,
        itemBuilder: (context, index) {
          final activity = group.activities[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(activity.title),
              subtitle: Text(activity.description,style: TextStyle(color: Color(0xff36D6E7)),),
              trailing: Text(
                '${activity.date.day}/${activity.date.month}/${activity.date.year}',
                style: const TextStyle(color: Color(0xffFEB06A)),
              ),
            ),
          );
        },
      ),
    );
  }
}