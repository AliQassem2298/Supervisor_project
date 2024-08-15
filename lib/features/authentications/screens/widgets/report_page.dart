// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ReportPage extends StatefulWidget {
//   @override
//   _ReportPageState createState() => _ReportPageState();
// }

// class _ReportPageState extends State<ReportPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _strengthsController = TextEditingController();
//   final TextEditingController _weaknessesController = TextEditingController();
//   final TextEditingController _recommendationsController =
//       TextEditingController();

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _descriptionController.dispose();
//     _strengthsController.dispose();
//     _weaknessesController.dispose();
//     _recommendationsController.dispose();
//     super.dispose();
//   }

//   Future<void> sendReport() async {
//     final String url = 'https://yourserver.com/api/reports';
//     final Map<String, dynamic> reportData = {
//       'title': _titleController.text,
//       'description': _descriptionController.text,
//       'strengths': _strengthsController.text,
//       'weaknesses': _weaknessesController.text,
//       'recommendations': _recommendationsController.text,
//     };

//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(reportData),
//       );

//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Report submitted successfully')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to submit report')),
//         );
//       }
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $error')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xfff8f5fa),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Center(child: Text('Report Page')),
//         backgroundColor: Color(0xffE4C9E5),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               _buildTextField(
//                 controller: _titleController,
//                 labelText: 'Title',
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a title';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),
//               _buildTextField(
//                 controller: _descriptionController,
//                 labelText: 'Description',
//                 maxLines: 3,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a description';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),
//               _buildTextField(
//                 controller: _strengthsController,
//                 labelText: 'Strengths',
//                 maxLines: 3,
//               ),
//               SizedBox(height: 16),
//               _buildTextField(
//                 controller: _weaknessesController,
//                 labelText: 'Weaknesses',
//                 maxLines: 3,
//               ),
//               SizedBox(height: 16),
//               _buildTextField(
//                 controller: _recommendationsController,
//                 labelText: 'Recommendations',
//                 maxLines: 3,
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     sendReport();
//                   }
//                 },
//                 child: Text('Submit'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xffFEB06A),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String labelText,
//     int maxLines = 1,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: labelText,
//         border: OutlineInputBorder(),
//       ),
//       validator: validator,
//       maxLines: maxLines,
//     );
//   }
// }
