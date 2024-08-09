import 'package:flutter/material.dart';

class ViewReportPage extends StatefulWidget {
  const ViewReportPage({super.key});

  @override
  State<ViewReportPage> createState() => _ViewReportPageState();
}

class _ViewReportPageState extends State<ViewReportPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  String _report = '';

  void _fetchReport() {
    // Placeholder function to simulate fetching the report
    // You should replace this with your actual report fetching logic
    setState(() {
      _report = 'Report for ${_nameController.text} (Number: ${_numberController.text})';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f5fa),
      appBar: AppBar(
        backgroundColor: Color(0xffE4C9E5),
        title: Text('View Report Page',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Volunteer Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _numberController,
              decoration: InputDecoration(
                labelText: 'Volunteer Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchReport,
              child: Text('عرض التقرير'),
            ),
            SizedBox(height: 24),
            _report.isNotEmpty
                ? Text(
              _report,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ViewReportPage(),
  ));
}

