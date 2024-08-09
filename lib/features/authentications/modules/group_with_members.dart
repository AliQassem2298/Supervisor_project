class GroupWithMembers {
  final String name;
  final String? supervisor;
  List<String> members;
  List<Activity> activities;

  GroupWithMembers(
      {required this.name,
      this.supervisor,
      required this.members,
      required this.activities});

  void addMember(String memberName) {
    members.add(memberName);
  }

  void removeMember(int index) {
    members.removeAt(index);
  }
}

class Activity {
  final String title;
  final String description;
  final DateTime date;

  Activity(
      {required this.title, required this.description, required this.date});
}

// Sample data
final List<GroupWithMembers> groupsList = [
  GroupWithMembers(
    name: 'Group 1',
    supervisor: 'John Doe',
    members: ['Member 1', 'Member 2'],
    activities: [
      Activity(
          title: 'Activity 1',
          description: 'Description 1',
          date: DateTime.now()),
      Activity(
          title: 'Activity 2',
          description: 'Description 2',
          date: DateTime.now().add(Duration(days: 1))),
      Activity(
          title: 'Activity 3',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 2))),
      Activity(
          title: 'Activity 4',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 3))),
      Activity(
          title: 'Activity 5',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 4))),
      Activity(
          title: 'Activity 6',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 5))),
    ],
  ),
  GroupWithMembers(
    name: 'Group 2',
    supervisor: 'Jane Smith',
    members: ['Member 3', 'Member 4'],
    activities: [
      Activity(
          title: 'Activity 7',
          description: 'Description 3',
          date: DateTime.now().add(Duration(days: 6))),
      Activity(
          title: 'Activity 8',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 7))),
      Activity(
          title: 'Activity 9',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 8))),
      Activity(
          title: 'Activity 10',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 9))),
      Activity(
          title: 'Activity 11',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 10))),
    ],
  ),
  GroupWithMembers(
    name: 'Group 3',
    supervisor: 'Hiba Omar',
    members: ['Member 5', 'Member 6'],
    activities: [
      Activity(
          title: 'Activity 12',
          description: 'Description 5',
          date: DateTime.now().add(Duration(days: 11))),
      Activity(
          title: 'Activity 13',
          description: 'Description 6',
          date: DateTime.now().add(Duration(days: 12))),
      Activity(
          title: 'Activity 14',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 13))),
      Activity(
          title: 'Activity 15',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 14))),
      Activity(
          title: 'Activity 16',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 15))),
    ],
  ),
  GroupWithMembers(
    name: 'Group 4',
    supervisor: 'Seba Omar',
    members: ['Member 7', 'Member 8'],
    activities: [
      Activity(
          title: 'Activity 17',
          description: 'Description 7',
          date: DateTime.now().add(Duration(days: 16))),
      Activity(
          title: 'Activity 18',
          description: 'Description 8',
          date: DateTime.now().add(Duration(days: 17))),
      Activity(
          title: 'Activity 19',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 18))),
      Activity(
          title: 'Activity 20',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 19))),
      Activity(
          title: 'Activity 21',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 20))),
    ],
  ),
  GroupWithMembers(
    name: 'Group 3',
    supervisor: 'Laila Samer',
    members: ['Member 9', 'Member 10'],
    activities: [
      Activity(
          title: 'Activity 21',
          description: 'Description 9',
          date: DateTime.now().add(Duration(days: 21))),
      Activity(
          title: 'Activity 22',
          description: 'Description 10',
          date: DateTime.now().add(Duration(days: 22))),
      Activity(
          title: 'Activity 23',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 23))),
      Activity(
          title: 'Activity 24',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 24))),
      Activity(
          title: 'Activity 25',
          description: 'Description 4',
          date: DateTime.now().add(Duration(days: 25))),
    ],
  ),
];
