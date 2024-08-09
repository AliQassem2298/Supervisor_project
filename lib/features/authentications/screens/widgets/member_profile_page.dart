/*class ProfilePage extends StatefulWidget {
  final String member;

  ProfilePage({required this.member});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  bool _isExpanded = false;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f5fa),
      appBar: AppBar(
          backgroundColor: Color(0xffE4C9E5),
        title: Center(
          child: Text(
            'Profile: ${widget.member}',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (builder) => bottomSheet(),
                );
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _isExpanded ? 200 : 110,
                width: _isExpanded ? 200 : 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffD3D3D3),
                  image: _image != null
                      ? DecorationImage(image: FileImage(_image!), fit: BoxFit.cover)
                      : null,
                ),
                child: _image == null
                    ? Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 50,
                )
                    : null,
              ).animate().scale(),
            ),
            SizedBox(height: 20),
            buildProfileSection('Basic Information', [
              buildTextField('Full Name', borderColor: Color(0xffFEB06A), labelColor: Color(0xffFEB06A)),
              buildTextField('Birth Date', borderColor: Color(0xffFEB06A), labelColor: Color(0xffFEB06A)),
              buildTextField('Gender', borderColor: Color(0xffFEB06A), labelColor:Color(0xffFEB06A)),
              buildTextField('Address', borderColor: Color(0xffFEB06A), labelColor: Color(0xffFEB06A)),
              buildTextField('Phone Number', borderColor:Color(0xffFEB06A), labelColor: Color(0xffFEB06A)),
              buildTextField('Email', borderColor: Color(0xffFEB06A), labelColor: Color(0xffFEB06A)),
            ], titleColor: Color(0xffFEB06A)),
            buildProfileSection('Education and Experience', [
              buildTextField('Educational Level', borderColor: Color(0xff4d4c4c), labelColor: Color(0xff4d4c4c)),
              buildTextField('Previous Volunteer Activities', borderColor: Color(0xff4d4c4c), labelColor: Color(0xff4d4c4c)),
              buildTextField('Organizations Worked With', borderColor: Color(0xff4d4c4c), labelColor: Color(0xff4d4c4c)),
            ], titleColor: Color(0xff4d4c4c)),
            buildProfileSection('Skills', [
              buildTextField('Leadership Skills', borderColor: Color(0xff36D6E7), labelColor:  Color(0xff36D6E7)),
              buildTextField('Time Management Skills', borderColor:  Color(0xff36D6E7), labelColor:  Color(0xff36D6E7)),
              buildTextField('Social Skills', borderColor:  Color(0xff36D6E7), labelColor: Color(0xff36D6E7)),
            ], titleColor:  Color(0xff36D6E7)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleExpand,
        child: Icon(
          _isExpanded ? Icons.expand_less : Icons.expand_more,
          color: Colors.white,
        ),
      ).animate().scale(),
    );
  }

  Widget buildTextField(String labelText, {required Color borderColor, required Color labelColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2.0),
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: labelColor),
        ),
      ).animate().fadeIn(),
    );
  }

  Widget buildProfileSection(String title, List<Widget> fields, {required Color titleColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ).animate().fadeIn(), // Animation for section titles
        ),
        ...fields,
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.camera,
              color: Colors.lightBlueAccent,
            ),
            title: Text('Take a picture'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.photo_library,
              color: Colors.lightBlueAccent,
            ),
            title: Text('Choose from gallery'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_animate/flutter_animate.dart'; // استيراد مكتبة الأنيميشن
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project_2tamayoz/models/volunteer_under_supervisor_model.dart';
import 'package:project_2tamayoz/services/make_report_service.dart';

class ProfilePage extends StatefulWidget {
  final Volunteer member;

  ProfilePage({required this.member});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  bool _isExpanded = false;
  final TextEditingController _customController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _requestPermissions() async {
    if (await Permission.camera.request().isGranted &&
        await Permission.photos.request().isGranted) {
      // Permissions are granted
    } else {
      // Handle the case when permissions are not granted
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    await _requestPermissions(); // Request permissions

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  bool isLoading = false;

  void loadingIndecatorFalse() {
    isLoading = false;
    setState(() {});
  }

  void loadingIndecatorTrue() {
    isLoading = true;
    setState(() {});
  }

  void _validateAndSubmit() async {
    if (_formKey.currentState!.validate()) {
      loadingIndecatorTrue();

      try {
        await MakeReportService().makeReport(
          volunteerId: widget.member.id,
          description: _customController.text,
        );
        print('Validated: ${_customController.text}');

        print('Success');
        loadingIndecatorFalse();

        Get.snackbar(
          'Success',
          'report made Successfully',
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
  }

  @override
  void dispose() {
    _customController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Color(0xfff8f5fa),
        appBar: AppBar(
          backgroundColor: Color(0xffE4C9E5),
          title: Center(
            child: Text(
              'Profile: ${widget.member.user.firstName} ${widget.member.user.lastName}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (builder) => bottomSheet(),
                    );
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: _isExpanded ? 200 : 110,
                    width: _isExpanded ? 200 : 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffD3D3D3),
                      image: _image != null
                          ? DecorationImage(
                              image: FileImage(_image!), fit: BoxFit.cover)
                          : null,
                    ),
                    child: _image == null
                        ? Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 50,
                          )
                        : null,
                  ).animate().scale(),
                ),
                SizedBox(height: 20),
                buildProfileSection(
                    'Basic Information',
                    [
                      buildTextField(
                          '${widget.member.user.firstName} ${widget.member.user.lastName}',
                          borderColor: Color(0xffFEB06A),
                          labelColor: Color(0xffFEB06A)),
                      buildTextField('${widget.member.user.birthDate}',
                          borderColor: Color(0xffFEB06A),
                          labelColor: Color(0xffFEB06A)),
                      buildTextField('${widget.member.user.gender}',
                          borderColor: Color(0xffFEB06A),
                          labelColor: Color(0xffFEB06A)),
                      buildTextField('${widget.member.user.address}',
                          borderColor: Color(0xffFEB06A),
                          labelColor: Color(0xffFEB06A)),
                      buildTextField('${widget.member.user.mobilePhone}',
                          borderColor: Color(0xffFEB06A),
                          labelColor: Color(0xffFEB06A)),
                      buildTextField('${widget.member.user.email}',
                          borderColor: Color(0xffFEB06A),
                          labelColor: Color(0xffFEB06A)),
                    ],
                    titleColor: Color(0xffFEB06A)),
                buildProfileSection(
                    'Education and Experience',
                    [
                      buildTextField('Educational Level',
                          borderColor: Color(0xff4d4c4c),
                          labelColor: Color(0xff4d4c4c)),
                      buildTextField('Previous Volunteer Activities',
                          borderColor: Color(0xff4d4c4c),
                          labelColor: Color(0xff4d4c4c)),
                      buildTextField('Organizations Worked With',
                          borderColor: Color(0xff4d4c4c),
                          labelColor: Color(0xff4d4c4c)),
                    ],
                    titleColor: Color(0xff4d4c4c)),
                buildProfileSection(
                    'Skills',
                    [
                      buildTextField('Leadership Skills',
                          borderColor: Color(0xff36D6E7),
                          labelColor: Color(0xff36D6E7)),
                      buildTextField('Time Management Skills',
                          borderColor: Color(0xff36D6E7),
                          labelColor: Color(0xff36D6E7)),
                      buildTextField('Social Skills',
                          borderColor: Color(0xff36D6E7),
                          labelColor: Color(0xff36D6E7)),
                    ],
                    titleColor: Color(0xff36D6E7)),
                buildTextFieldWithController('Write your Report',
                    controller: _customController,
                    borderColor: Colors.blue,
                    labelColor: Colors.blue),
                ElevatedButton(
                  onPressed: _validateAndSubmit,
                  child: Text('Create Report'),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggleExpand,
          backgroundColor: Color(0xffE4C9E5),
          child: Icon(
            _isExpanded ? Icons.expand_less : Icons.expand_more,
            color: Colors.white,
          ),
        ).animate().scale(),
      ),
    );
  }

  Widget buildTextField(String labelText,
      {required Color borderColor, required Color labelColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2.0),
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: labelColor),
        ),
      ).animate().fadeIn(),
    );
  }

  Widget buildTextFieldWithController(String labelText,
      {required TextEditingController controller,
      required Color borderColor,
      required Color labelColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2.0),
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: labelColor),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'The text is required... ';
          }
          return null;
        },
      ).animate().fadeIn(),
    );
  }

  Widget buildProfileSection(String title, List<Widget> fields,
      {required Color titleColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ).animate().fadeIn(), // Animation for section titles
        ),
        ...fields,
      ],
    );
  }

  Widget bottomSheet() {
    return Wrap(
      children: [
        ListTile(
          leading: Icon(
            Icons.camera,
            color: Colors.lightBlueAccent,
          ),
          title: Text('Take a picture'),
          onTap: () {
            Navigator.pop(context);
            _pickImage(ImageSource.camera);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.photo_library,
            color: Colors.lightBlueAccent,
          ),
          title: Text('Choose from gallery'),
          onTap: () {
            Navigator.pop(context);
            _pickImage(ImageSource.gallery);
          },
        ),
      ],
    );
  }
}
