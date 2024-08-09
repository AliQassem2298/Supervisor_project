import 'package:flutter/material.dart';
import 'package:project_2tamayoz/models/volunteer_report_model.dart';
import 'package:project_2tamayoz/models/volunteer_under_supervisor_model.dart';
import 'package:project_2tamayoz/services/volunteer_report_service.dart';

class ActivityPage extends StatelessWidget {
  final Volunteer volunteer;

  ActivityPage({required this.volunteer});

  @override
  Widget build(BuildContext context) {
    // افتراضيا، هنا يمكنك جلب البيانات الحقيقية المتعلقة بالنشاط من قاعدة البيانات أو تمريرها كمعلمات
    // final String activityName = 'Activity for $memberName';
    // final String activityDescription =
    //     'Description of the activity that $memberName is involved in.';
    // final int numberOfMembers =
    //     5; // يمكنك تغيير هذا الرقم بحسب البيانات الفعلية

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE4C9E5),
        title: Text(
          'Report page',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: FutureBuilder<VolunteerReportModel>(
        future: VolunteerReportService().volunteerReport(
          userId: volunteer.userId,
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
                'No reports for this volunteer.',
                style: const TextStyle(),
              ),
            );
          } else {
            VolunteerReportModel volunteerReportModel = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        volunteerReportModel.reportData.description,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(height: 10),
                      // Text(
                      //   'activityDescription',
                      //   style: TextStyle(fontSize: 16),
                      // ),
                      const SizedBox(height: 20),
                      Text(
                        'Number of the volunteer: ${volunteerReportModel.reportData.volunteerId}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
