import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    this.imageUrl,
    this.message = 'السلام عليكم',
    this.sender = 'محمد',
    this.time = '4:00',
  });
  final String sender;
  final String message;
  final String? imageUrl;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sender,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    message,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
          Text(time),
        ],
      ),
    );
  }
}
