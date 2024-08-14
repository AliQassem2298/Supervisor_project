import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:intl/intl.dart';
import 'package:project_2tamayoz/services/add_book_service.dart'; // Import intl for date formatting

class AddBookPage extends StatefulWidget {
  final VoidCallback onBookAdded; // Add this line

  AddBookPage({super.key, required this.onBookAdded}); // Modify constructor
  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final TextEditingController bookTitile = TextEditingController();
  final TextEditingController authorName = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController imagePathController = TextEditingController();

  var _formkey = GlobalKey<FormState>();
  bool isLoading = false;

  void loadingIndecatorFalse() {
    isLoading = false;
    setState(() {});
  }

  void loadingIndecatorTrue() {
    isLoading = true;
    setState(() {});
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePathController.text = image.path;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      date.text =
          formattedDate; // Update the text field with the formatted date
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE4C9E5),
          title: const Text(
            'Add Book',
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
                    controller: bookTitile,
                    decoration: InputDecoration(
                      labelText: 'Book Title',
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
                    controller: authorName,
                    decoration: InputDecoration(
                      labelText: 'Author Name',
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
                    controller: date,
                    decoration: InputDecoration(
                      labelText: 'Date',
                      border: OutlineInputBorder(),
                    ),
                    readOnly:
                        true, // Make the field read-only to prevent manual editing
                    onTap: () =>
                        _selectDate(context), // Open the date picker on tap
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: Text('Pick Book Photo'),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: imagePathController,
                    decoration: InputDecoration(
                      labelText: 'Image Path',
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          loadingIndecatorTrue();

                          try {
                            await AddBookService().addBook(
                              title: bookTitile.text,
                              author: authorName.text,
                              date: date.text,
                              imageName: imagePathController.text,
                            );
                            widget.onBookAdded();

                            print('Success');
                            loadingIndecatorFalse();

                            Get.snackbar(
                              'Success',
                              'Book added successfully',
                            );
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
                      child: Text('Add The Book'),
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
