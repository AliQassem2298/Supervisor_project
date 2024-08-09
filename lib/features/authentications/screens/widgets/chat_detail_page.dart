import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/chat.dart';

class ChatDetailPage extends StatefulWidget {
  final Chat chat;
  final List<Chat> chats;
  final ValueNotifier<List<Chat>> filteredChatsNotifier;

  const ChatDetailPage({Key? key, required this.chat, required this.chats, required this.filteredChatsNotifier}) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> messages = [];

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedMessages = prefs.getStringList('chat_${widget.chat.name}');
    if (savedMessages != null) {
      setState(() {
        messages.addAll(savedMessages);
      });
    }
  }

  void _saveMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('chat_${widget.chat.name}', messages);
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(_controller.text);
        _controller.clear();
      });
      _saveMessages(); // Save messages whenever a new message is added

      // Update the corresponding chat in the chats list with the latest message
      final index = widget.chats.indexWhere((c) => c.name == widget.chat.name);
      if (index != -1) {
        setState(() {
          widget.chats[index].message = _controller.text;
          widget.filteredChatsNotifier.value = List.from(widget.chats); // Update filtered chats too
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f5fa),
      appBar: AppBar(
        backgroundColor: Color(0xffE4C9E5),
        title: Text(widget.chat.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xffE4C9E5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(messages[index]),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors.grey, // لون الحواف الافتراضي
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Color(0xffE4C9E5), // لون الحواف عند التركيز
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Color(0xffFEB06A), // لون الحواف عند عدم التركيز
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Color(0xffFEB06A)),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
