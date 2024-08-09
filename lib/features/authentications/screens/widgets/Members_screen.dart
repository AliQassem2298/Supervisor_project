/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

import '../../modules/group_with_members.dart';
class MembersPage extends StatefulWidget {
  final GroupWithMembers group;

  const MembersPage({Key? key, required this.group}) : super(key: key);

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  final TextEditingController _controller = TextEditingController();


  void _addMember() {
    String memberName = _controller.text.trim();
    if (memberName.isNotEmpty) {
      setState(() {
        widget.group.addMember(memberName);
      });
      _controller.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a member name.'),
        ),
      );
    }
  }

  void _deleteMember(int index) {
    setState(() {
      widget.group.removeMember(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text('Add Member to ${widget.group.name}',style: TextStyle(fontSize: 18,color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(

              controller: _controller,
              decoration: InputDecoration(

                labelText: 'Member Name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add,color: Colors.pinkAccent[200],),
                  onPressed: _addMember,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.group.members.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.group.members[index],style: TextStyle(fontSize: 15,color: Colors.deepOrange[400]),),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,color: Colors.red[600],),
                      onPressed: () => _deleteMember(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
*/

/*class MembersPage extends StatefulWidget {
  final GroupWithMembers group;

  const MembersPage({Key? key, required this.group}) : super(key: key);

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  final TextEditingController _controller = TextEditingController();
  int _selectedIndex = 0;

  void _addMember() {
    String memberName = _controller.text.trim();
    if (memberName.isNotEmpty) {
      setState(() {
        widget.group.addMember(memberName);
      });
      _controller.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a member name.'),
        ),
      );
    }
  }

  void _deleteMember(int index) {
    setState(() {
      widget.group.removeMember(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f5fa),
      appBar: AppBar(
          backgroundColor:  Color(0xffE4C9E5),
        title: Center(
          child: Text(
            'Add Member to ${widget.group.name}',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Member Name',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.add, color:Color(0xffFEB06A)),
                      onPressed: _addMember,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.group.members.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        widget.group.members[index],
                        style: TextStyle(fontSize: 15, color: Colors.lightBlue[400]),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red[700]),
                        onPressed: () => _deleteMember(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/volunteer_under_supervisor_model.dart';
import 'package:project_2tamayoz/services/delete_volunteer_from_groub_service.dart';
import 'package:project_2tamayoz/services/volunteer_under_supervisor_service.dart';

import '../../modules/group_with_members.dart';

import 'members_activity_page.dart'; // استيراد صفحة النشاط الجديدة

class MembersPage extends StatefulWidget {
  final GroupWithMembers group;

  const MembersPage({Key? key, required this.group}) : super(key: key);

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  final TextEditingController _controller = TextEditingController();
  int _selectedIndex = 0;
  bool isLoading = false;

  void loadingIndecatorFalse() {
    isLoading = false;
    setState(() {});
  }

  void loadingIndecatorTrue() {
    isLoading = true;
    setState(() {});
  }

  void _addMember() {
    String memberName = _controller.text.trim();
    if (memberName.isNotEmpty) {
      setState(() {
        widget.group.addMember(memberName);
      });
      _controller.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a member name.'),
        ),
      );
    }
  }

  void _deleteMember(int index) {
    setState(() {
      widget.group.removeMember(index);
    });
  }

  void _navigateToActivity(Volunteer volunteer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ActivityPage(volunteer: volunteer),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f5fa),
      appBar: AppBar(
        backgroundColor: Color(0xffE4C9E5),
        title: Center(
          child: Text(
            'Add Member to ${widget.group.name}',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Member Name',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.add, color: Color(0xffFEB06A)),
                      onPressed: _addMember,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<VolunteerUnderSupervisorModel>(
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
                      child: Text(
                        snapshot.error.toString(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'No volunteers under this supervisor.',
                        style: TextStyle(),
                      ),
                    );
                  } else {
                    List<Volunteer> volunteers = snapshot.data!.volunteers;

                    return ModalProgressHUD(
                      inAsyncCall: isLoading,
                      child: ListView.builder(
                        itemCount: volunteers.length,
                        clipBehavior: Clip.none,
                        itemBuilder: (context, index) {
                          final Volunteer volunteer = volunteers[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                                title: Text(
                                  '${volunteer.user.firstName} ${volunteer.user.lastName}',
                                  style: const TextStyle(
                                      fontSize: 15, color: Color(0xFF272727)),
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete,
                                      color: Colors.red[700]),
                                  onPressed: () async {
                                    // _deleteMember(index);
                                    print('${volunteer.id}');
                                    loadingIndecatorTrue();

                                    try {
                                      await DeleteVolunteerFromGroubService()
                                          .deleteVolunteerFromGroub(
                                        id: volunteer.id,
                                      );
                                      print('Success');
                                      loadingIndecatorFalse();

                                      Get.snackbar(
                                        'Success',
                                        'Volunteer deleted successfully',
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
                                  },
                                ),
                                onTap: () {
                                  _navigateToActivity(
                                    volunteers[index],
                                  );
                                }),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
