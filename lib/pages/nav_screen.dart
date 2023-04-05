import 'package:chat/pages/chat.dart';
import 'package:chat/pages/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => NavScreenState();
}

class NavScreenState extends State<NavScreen> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    const pages = [ChatPage(), SettingsPage()];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (newIndex) {
            setState(() {
              index = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
