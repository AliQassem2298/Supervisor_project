// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, unused_element

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_2tamayoz/main.dart';

class SupervisorProfilePage extends StatefulWidget {
  final String supervisor;

  const SupervisorProfilePage({super.key, required this.supervisor});

  @override
  _SupervisorProfilePageState createState() => _SupervisorProfilePageState();
}

class _SupervisorProfilePageState extends State<SupervisorProfilePage> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  // final TextEditingController _positionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _bioController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    setState(() {
      _firstNameController.text =
          sharedPreferences!.getString("first_name") ?? '';
      _lastNameController.text =
          sharedPreferences!.getString("last_name") ?? '';

      // _positionController.text =
      //     sharedPreferences!.getString("position") ?? ''; /////////// what ??!
      _emailController.text = sharedPreferences!.getString("email") ?? '';
      _phoneController.text =
          sharedPreferences!.getString("mobile_phone") ?? '';
      // _bioController.text =
      //     sharedPreferences!.getString("bio") ?? ''; ////////// what ??!
      String? imagePath =
          sharedPreferences!.getString("imagePath"); ////////// what ??!
      if (imagePath != null && imagePath.isNotEmpty) {
        _imageFile = File(imagePath);
      }
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future<void> _saveProfile() async {
    await sharedPreferences!.setString("first_name", _firstNameController.text);
    await sharedPreferences!.setString("last_name", _lastNameController.text);
    // await sharedPreferences!.setString("position", _positionController.text);
    await sharedPreferences!.setString("email", _emailController.text);
    await sharedPreferences!.setString("mobile_phone", _phoneController.text);
    // await sharedPreferences!.setString("bio", _bioController.text);
    if (_imageFile != null) {
      await sharedPreferences!.setString('imagePath', _imageFile!.path);
    }
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Profile Saved'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f5fa),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffE4C9E5),
        title: Text(
          'Profile: ${_firstNameController.text} ${_lastNameController.text}',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Color(0xffFEB06A),
              size: 30,
            ),
            onPressed: () {
              setState(() {
                _isEditing = true;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => _buildBottomSheet(context),
                );
              },
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(200),
                      image: _imageFile != null
                          ? DecorationImage(
                              image: FileImage(_imageFile!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: _imageFile == null
                        ? Center(
                            child: Icon(
                              Icons.camera_alt,
                              size: 60,
                              color: Colors.grey[800],
                            ),
                          )
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt_rounded),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => _buildBottomSheet(context),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _isEditing
                ? _buildProfileSection('Personal Information', [
                    _buildEditableTextField('First Name', _firstNameController),
                    _buildEditableTextField('Last Name', _lastNameController),
                    // _buildEditableTextField('Position', _positionController),
                    _buildEditableTextField('Email', _emailController),
                    _buildEditableTextField('Phone Number', _phoneController),
                  ])
                : _buildProfileSection('Personal Information', [
                    _buildTextField('First Name', _firstNameController),
                    _buildTextField('Last Name', _lastNameController),
                    // _buildTextField('Position', _positionController),
                    _buildTextField('Email', _emailController),
                    _buildTextField('Phone Number', _phoneController),
                  ]),
            // SizedBox(height: 20),
            // _isEditing
            //     ? _buildProfileSection('About Me', [
            //         _buildEditableTextField('Bio', _bioController),
            //       ])
            //     : _buildProfileSection('About Me', [
            //         _buildTextField('Bio', _bioController),
            //       ]),
            SizedBox(height: 20),
            _isEditing
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isEditing = false;
                        _saveProfile();
                      });
                    },
                    child: Text('Save Changes'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFEB06A), // Background color
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        style: TextStyle(
          color: Colors.black, // Set text color here
        ),
        controller: controller,
        enabled: false,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildEditableTextField(
      String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        style: TextStyle(
          color: Colors.black, // Set text color here
        ),
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
        ),
      ),
    );
  }

  Widget _buildProfileSection(String title, List<Widget> fields) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        ...fields,
      ],
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.camera_alt,
              color: Color(0xff36D6E7),
            ),
            title: Text('Take a picture'),
            onTap: () async {
              Navigator.pop(context);
              final pickedFile =
                  await _picker.pickImage(source: ImageSource.camera);
              if (pickedFile != null) {
                setState(() {
                  _imageFile = File(pickedFile.path);
                });
              }
            },
          ),
          ListTile(
            leading: Icon(
              Icons.photo_library,
              color: Color(0xff36D6E7),
            ),
            title: Text('Choose from gallery'),
            onTap: () async {
              Navigator.pop(context);
              final pickedFile =
                  await _picker.pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                setState(() {
                  _imageFile = File(pickedFile.path);
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
