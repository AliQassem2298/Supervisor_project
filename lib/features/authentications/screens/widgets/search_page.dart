import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_2tamayoz/main.dart';
import 'package:project_2tamayoz/models/volunteer_under_supervisor_model.dart';
import 'package:project_2tamayoz/services/search_volunteer_service.dart';
import 'package:project_2tamayoz/services/volunteer_under_supervisor_service.dart';

import 'member_profile_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<Volunteer> volunteers = [];
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    _loadVolunteersUnderSupervisor();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      if (searchController.text.isEmpty) {
        _loadVolunteersUnderSupervisor();
      } else {
        _searchVolunteers();
      }
    });
  }

  Future<void> _loadVolunteersUnderSupervisor() async {
    try {
      final response = await VolunteerUnderSupervisorService()
          .volunteerUnderSupervisor(id: sharedPreferences!.getInt("id")!);
      setState(() {
        volunteers = response.volunteers;
      });
    } catch (error) {
      setState(() {
        volunteers = [];
      });
    }
  }

  Future<void> _searchVolunteers() async {
    try {
      final response = await SearchVolunteerService().searchVolunteer(
        id: sharedPreferences!.getInt("id")!,
        searchQuery: searchController.text,
      );
      setState(() {
        volunteers = response.volunteers;
      });
    } catch (error) {
      setState(() {
        volunteers = [];
      });
    }
  }

  void _navigateToProfile(BuildContext context, Volunteer volunteer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(member: volunteer),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f5fa),
      appBar: AppBar(
        backgroundColor: const Color(0xffE4C9E5),
        automaticallyImplyLeading: false,
        title: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            icon: Icon(Icons.search, color: Colors.white, size: 35),
            hintText: 'Search members...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white, fontSize: 20),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<void>(
          future: searchController.text.isEmpty
              ? VolunteerUnderSupervisorService().volunteerUnderSupervisor(
                  id: sharedPreferences!.getInt("id")!)
              : SearchVolunteerService().searchVolunteer(
                  id: sharedPreferences!.getInt("id")!,
                  searchQuery: searchController.text,
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
            } else if (volunteers.isEmpty) {
              return Center(
                child: Text(
                  searchController.text.isEmpty
                      ? 'No volunteers under this supervisor.'
                      : 'No volunteer with this name.',
                  style: const TextStyle(),
                ),
              );
            } else {
              return ListView.builder(
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
                        icon:
                            const Icon(Icons.person, color: Color(0xff36D6E7)),
                        onPressed: () {
                          _navigateToProfile(context, volunteer);
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
