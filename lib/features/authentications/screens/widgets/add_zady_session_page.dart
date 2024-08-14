import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_2tamayoz/services/add_zady_session_service.dart';

class AddZadySessionPage extends StatefulWidget {
  AddZadySessionPage({super.key});
  @override
  State<AddZadySessionPage> createState() => _AddZadySessionPageState();
}

class _AddZadySessionPageState extends State<AddZadySessionPage> {
  final TextEditingController sessionDateTimeController =
      TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController sessionHoursController = TextEditingController();
  bool isLoading = false;

  void loadingIndecatorFalse() {
    isLoading = false;
    setState(() {});
  }

  void loadingIndecatorTrue() {
    isLoading = true;
    setState(() {});
  }

  var _formKey = GlobalKey<FormState>();

  Future<void> _selectDateTime(BuildContext context) async {
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
        sessionDateTimeController.text = formattedDateTime;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int bookId = ModalRoute.of(context)!.settings.arguments as int;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE4C9E5),
          title: const Text(
            'Add Z.A.D.Y Session',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: sessionDateTimeController,
                    decoration: InputDecoration(
                      labelText: 'Session Date and Time',
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true,
                    onTap: () => _selectDateTime(context),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: durationController,
                    decoration: InputDecoration(
                      labelText: 'Duration (minutes)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                      int? duration = int.tryParse(value);
                      if (duration == null || duration < 10 || duration > 60) {
                        return 'Duration must be between 10 and 60 minutes';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: sessionHoursController,
                    decoration: InputDecoration(
                      labelText: 'Session Hours',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                      // Add additional validation for session hours if needed
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          loadingIndecatorTrue();
                          try {
                            await AddZadySessionService().addZadySession(
                              bookId: bookId,
                              sessionDate: sessionDateTimeController.text,
                              duration: durationController.text,
                              sessionHours: sessionHoursController.text,
                            );

                            print('Success');
                            loadingIndecatorFalse();

                            Get.snackbar(
                              'Success',
                              'Z.A.D.Y Session added successfully',
                            );
                          } catch (e) {
                            print(e.toString());
                            Get.snackbar(
                              'Sorry',
                              e.toString(),
                            );
                          }
                          loadingIndecatorFalse();
                        }
                      },
                      child: Text('Add Zady Session'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
