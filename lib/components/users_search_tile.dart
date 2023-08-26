import 'package:flutter/material.dart';
import 'package:message_app/components/get_progile_image.dart';
import 'package:message_app/database/auth.dart';

class UsersSearchTile extends StatelessWidget {
  String uid;
  String username;
  
  UsersSearchTile({
    required this.username,
    required this.uid,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: getProfileImage(uid, 20, context),
      contentPadding: const EdgeInsets.symmetric(horizontal: 2),
      horizontalTitleGap: 0,
      title: Text(
        username,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}