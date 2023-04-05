import 'package:chat/components/chat_card.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Text(
                  'Chat',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Broadcast Lists', style: TextStyle(color: Colors.blue)),
                    Text('New Group', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              const Divider(thickness: 2),
              const SizedBox(height: 16),

              // Chats
              const ChatCard(sender: 'نواف', message: 'هلا', time: '5:23 PM'),
              const ChatCard(),
              const ChatCard(),
              const ChatCard(),
              const ChatCard(),
              const ChatCard(),
              const ChatCard(),
              const ChatCard(),
              const ChatCard(),
              const ChatCard(),
            ],
          ),
        ),
      ),
    );
  }
}
