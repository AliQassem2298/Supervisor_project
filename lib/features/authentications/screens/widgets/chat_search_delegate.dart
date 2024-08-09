import 'package:flutter/material.dart';
import '../../modules/chat.dart';

class ChatSearchDelegate extends SearchDelegate {
  final List<Chat> chats;
  final Function(String) filterChats;

  ChatSearchDelegate(this.chats, this.filterChats);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          filterChats(query);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          filterChats(''); // إعادة تعيين البحث للحالة الأولية
        });
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    filterChats(query);
    return _buildFilteredList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    filterChats(query);
    return _buildFilteredList();
  }

  Widget _buildFilteredList() {
    final results = chats.where((chat) {
      final nameLower = chat.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final chat = results[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Text(chat.name[0]),
          ),
          title: Text(chat.name),
          subtitle: Text(chat.message),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(chat.time),
              if (chat.unreadMessages > 0)
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    chat.unreadMessages.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
