import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // استيراد DateFormat من المكتبة

import '../../modules/chat.dart';
import 'chat_detail_page.dart';
import 'chat_search_delegate.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Chat> chats = [
    Chat(name: 'hiba', message: '', time: '1:45 PM', unreadMessages: 2),
    Chat(name: 'leen', message: '', time: '12:30 PM', unreadMessages: 0),
    Chat(name: 'Solaf', message: '', time: '11:20 AM', unreadMessages: 0),
    Chat(name: 'katia', message: '', time: '10:05 AM', unreadMessages: 1),
  ];

  final ValueNotifier<List<Chat>> filteredChatsNotifier =
      ValueNotifier<List<Chat>>([]);

  @override
  void initState() {
    super.initState();
    filteredChatsNotifier.value = List.from(chats);
  }

  void _openChatDetail(Chat chat) async {
    // Reset unread messages count
    chat.unreadMessages = 0;

    final updatedMessages = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatDetailPage(
            chat: chat,
            chats: chats,
            filteredChatsNotifier: filteredChatsNotifier),
      ),
    );

    if (updatedMessages != null && updatedMessages is List<String>) {
      // Update messages in the chat list
      setState(() {
        chat.message = updatedMessages.last;
        chat.time = DateFormat.jm()
            .format(DateTime.now()); // Update time to the current time
        filteredChatsNotifier.value = List.from(chats);
      });
    } else {
      // Update filteredChatsNotifier to reflect the reset of unread messages
      setState(() {
        filteredChatsNotifier.value = List.from(chats);
      });
    }
  }

  void _filterChats(String query) {
    filteredChatsNotifier.value = chats.where((chat) {
      final nameLower = chat.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f5fa),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Chats'),
        backgroundColor: Color(0xffE4C9E5),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ChatSearchDelegate(chats, _filterChats),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ValueListenableBuilder<List<Chat>>(
        valueListenable: filteredChatsNotifier,
        builder: (context, filteredChats, _) {
          return ListView.builder(
            itemCount: filteredChats.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _openChatDetail(filteredChats[index]),
                child: Hero(
                  tag: 'chat_${filteredChats[index].name}',
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(0xffD3D3D3),
                          child: Text(filteredChats[index].name[0],
                              style: TextStyle(color: Color(0xFF272727))),
                        ),
                        title: Text(filteredChats[index].name,
                            style: TextStyle(color: Color(0xFF272727))),
                        subtitle: Text(filteredChats[index].message,
                            style: TextStyle(color: Color(0xFF272727))),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(filteredChats[index].time,
                                style: TextStyle(color: Color(0xFF272727))),
                            if (filteredChats[index].unreadMessages > 0)
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Color(0xff36D6E7),
                                child: Text(
                                  filteredChats[index]
                                      .unreadMessages
                                      .toString(),
                                  style: TextStyle(
                                      color: Color(0xFF272727), fontSize: 12),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
