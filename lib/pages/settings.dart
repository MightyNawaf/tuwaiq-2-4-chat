import 'dart:io';

import 'package:chat/splash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Map<String, dynamic>? data = {'name': '', 'phone_number': ''};
  late TextEditingController nameController;
  late TextEditingController phoneController;
  @override
  void initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    final userDocument =
        await FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser?.uid).get();
    setState(() {
      data = userDocument.data();
      nameController = TextEditingController(text: userDocument.data()?['name']);
      phoneController = TextEditingController(text: userDocument.data()?['phone_number']);
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  File file = File('');
  @override
  Widget build(BuildContext context) {
    if (data?['name'] == '' || data?['phone_number'] == '') {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //   GestureDetector(
                  //     onTap: () async {
                  //       final ImagePicker picker = ImagePicker();
                  //       final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                  //       file = File(image?.path ?? '');
                  //       setState(() {});
                  //     },
                  //     child: CircleAvatar(
                  //       radius: 70,
                  //       backgroundImage: FileImage(file),
                  //     ),
                  //   ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
                    ),
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Phone number',
                    ),
                    controller: phoneController,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          context.findAncestorStateOfType<SplashScreenState>()?.setState(() {});
                        },
                        child: const Text('Sign out'),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('user')
                              .doc(FirebaseAuth.instance.currentUser?.uid)
                              .set(
                            {'name': nameController.text, 'phone_number': phoneController.text},
                          );
                          setState(() {});
                        },
                        child: const Text('Update data'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
