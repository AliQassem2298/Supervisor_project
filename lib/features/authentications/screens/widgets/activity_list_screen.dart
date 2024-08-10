// ignore_for_file: use_super_parameters, must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_2tamayoz/models/get_groub_id_model.dart';

class ActivityListScreen extends StatelessWidget {
  GetGroubIdModel group;

  ActivityListScreen({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f5fa),
      appBar: AppBar(
        backgroundColor: Color(0xffE4C9E5),
        title: Text(
          group.groupName,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent[500]),
        ),
      ),
      body: ListView(
        // itemCount: group.activities.length,

        // final activity = group.activities[index];
        children: const [
          Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('activity.title'),
              subtitle: Text(
                'activity.description',
                style: TextStyle(color: Color(0xff36D6E7)),
              ),
              trailing: Text(
                '10/8/2024',
                style: TextStyle(color: Color(0xffFEB06A)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
