import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:message_app/components/get_progile_image.dart';
import 'package:message_app/database/auth.dart';
import 'package:message_app/screens/add_friend_screen.dart';
import 'package:message_app/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  User? currentUser = Auth().currentUser;

  @override
  Widget build(BuildContext context) {

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddFriendScreen(),));
            },
            child: Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ),
        title: const Text(
          "Messages",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700
          ),
        ),

        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen(),));
            },
            child: getProfileImage(currentUser!.uid.toString(), null, context),
          )
        ],
      ),
    );
  }
}