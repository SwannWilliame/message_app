import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:message_app/components/auth_validator.dart';
import 'package:message_app/components/profile_tile.dart';
import 'package:message_app/database/auth.dart';
import 'package:message_app/database/upload_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  User currentUser = Auth().currentUser!;

  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String message="";

  SnackBar snackBar = SnackBar(
    content: Text("Successfully registered")
  );

  @override
  Widget build(BuildContext context) {

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:15),
            child: GestureDetector(
              onTap: () {
                Auth().signOut();
                setState(() {
                  
                });
                Navigator.pop(context);
              },
              child: Icon(
                Icons.logout,
                size: 25,
              ),
            ),
          )
        ],
      ),

      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection('users').doc(currentUser.uid).snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return const CircularProgressIndicator.adaptive();
                }
                final userData = snapshot.data!.data() as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: selectImage,
                            child: CircleAvatar(
                              radius: 100,
                              foregroundColor: isDarkMode ? Colors.black : Colors.white,
                              backgroundColor: isDarkMode ? Colors.white : Colors.black,
                              foregroundImage: userData["profileurl"]=="" ? null : NetworkImage(userData["profileurl"]),
                              child: const Icon(Icons.person, size: 100,),
                            ),
                          ),
                        ),
                            
                        const SizedBox(height: 40,),
                        ProfileTile(title: "Username", data: userData["username"], controller: usernameController, validator: usernameValidator, keyboardType: TextInputType.name,),
                        const SizedBox(height: 20,),
                        ProfileTile(title: "Bio", data: userData["bio"], controller: bioController, keyboardType: TextInputType.multiline, validator: bioValidator,),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  )
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                onPressed: () async{
                                  if(_formKey.currentState!.validate()){
                                    try {
                                      await Auth().updateData({
                                        "username": usernameController.text,
                                        "bio": bioController.text,
                                      });
                                      setState(() {
                                        message="Infos successfully registered";
                                        snackBar = SnackBar(content: Text(message),);
                                      });
                                      
                                    } on FirebaseAuthException catch (e) {
                                      setState(() {
                                        snackBar = SnackBar(content: Text(e.message.toString()),);
                                      });
                                    }
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                                },
                              )
                            )
                          ],
                        ),
                        const SizedBox(height: 20,)
                  
                      ],
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}