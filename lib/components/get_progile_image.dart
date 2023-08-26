import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

StreamBuilder<DocumentSnapshot> getProfileImage(String uid, double? radius, BuildContext context){
  var brightness = MediaQuery.of(context).platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  
  return StreamBuilder<DocumentSnapshot>(
    stream: FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
    builder: (context, snapshot) {
      if(!snapshot.hasData){
        return const CircularProgressIndicator.adaptive();
      }
      final userData = snapshot.data!.data() as Map<String, dynamic>;
      return Padding(
        padding:  EdgeInsets.only(right: 20),
        child: CircleAvatar(
          backgroundColor: isDarkMode ? Colors.white : Colors.black,
          foregroundColor: isDarkMode ? Colors.black : Colors.white,
          foregroundImage: userData["profileurl"]=="" ? null : NetworkImage(userData["profileurl"]),
          child: Icon(Icons.person),
        ),
      );
    }
  );
}