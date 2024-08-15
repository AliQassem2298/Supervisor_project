import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/volunteer_under_supervisor_model.dart';
import 'package:project_2tamayoz/services/add_activity_service.dart';
import 'package:project_2tamayoz/services/volunteer_under_supervisor_service.dart';

class AddActivityPage extends StatefulWidget {
  final VoidCallback onActivityAdded; // Callback to refresh the previous screen

  const AddActivityPage({super.key, required this.onActivityAdded});

  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController startTime = TextEditingController();
  final TextEditingController endTime = TextEditingController();

  var _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  List<int> selectedVolunteerIds = []; // Track selected volunteer IDs
  List<Map<String, dynamic>> selectedVolunteers =
      []; // Store selected volunteer details

  void loadingIndecatorFalse() {
    setState(() {
      isLoading = false;
    });
  }

  void loadingIndecatorTrue() {
    setState(() {
      isLoading = true;
    });
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        final DateTime finalDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
          0,
        );
        String formattedDateTime =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(finalDateTime);
        controller.text = formattedDateTime;
      }
    }
  }

  void _toggleVolunteerSelection(Volunteer volunteer) {
    setState(() {
      if (selectedVolunteerIds.contains(volunteer.id)) {
        // If already selected, remove from the list
        selectedVolunteerIds.remove(volunteer.id);
        selectedVolunteers.removeWhere((v) => v['id'] == volunteer.id);
      } else {
        // If not selected, add to the list
        selectedVolunteerIds.add(volunteer.id);
        selectedVolunteers.add({
          'id': volunteer.id,
          'first_name': volunteer.user.firstName,
          'last_name': volunteer.user.lastName,
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE4C9E5),
        title: const Text(
          'Add Activity',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: description,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: startTime,
                  decoration: InputDecoration(
                    labelText: 'Start Time',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  onTap: () => _selectDate(context, startTime),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: endTime,
                  decoration: InputDecoration(
                    labelText: 'End Time',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  onTap: () => _selectDate(context, endTime),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                Divider(thickness: 1, color: Colors.grey[400]),
                SizedBox(height: 16),
                FutureBuilder<VolunteerUnderSupervisorModel>(
                  future: VolunteerUnderSupervisorService()
                      .volunteerUnderSupervisor(
                          id: sharedPreferences!.getInt("id")!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (!snapshot.hasData ||
                        snapshot.data!.volunteers.isEmpty) {
                      return const Center(
                        child: Text('No volunteers under this supervisor.'),
                      );
                    } else {
                      List<Volunteer> volunteers = snapshot.data!.volunteers;

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: volunteers.length,
                        itemBuilder: (context, index) {
                          final Volunteer volunteer = volunteers[index];
                          final bool isSelected =
                              selectedVolunteerIds.contains(volunteer.id);
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              title: Text(
                                '${volunteer.user.firstName} ${volunteer.user.lastName}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: isSelected
                                      ? Colors.white
                                      : Color(0xFF272727),
                                ),
                              ),
                              tileColor: isSelected ? Colors.blue : null,
                              onTap: () => _toggleVolunteerSelection(volunteer),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
                SizedBox(height: 16),
                Divider(thickness: 1, color: Colors.grey[400]),
                SizedBox(height: 16),
                Visibility(
                  visible: selectedVolunteers.isNotEmpty,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          loadingIndecatorTrue();

                          try {
                            await AddActivityService().addActivity(
                              name: name.text,
                              description: description.text,
                              startTime: startTime.text,
                              endTime: endTime.text,
                              volunteers: selectedVolunteers,
                            );

                            loadingIndecatorFalse();
                            Get.snackbar(
                              'Success',
                              'Activity added successfully',
                            );

                            widget
                                .onActivityAdded(); // Notify the previous screen
                            Navigator.pop(
                                context); // Go back to the previous screen
                          } catch (e) {
                            print(e.toString());
                            Get.snackbar(
                              'Sorry',
                              e.toString(),
                              colorText: Colors.white,
                            );
                          }
                          loadingIndecatorFalse();
                        }
                      },
                      child: Text('Add The Activity'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
