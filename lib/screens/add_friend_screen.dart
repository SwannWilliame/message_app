import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:message_app/components/users_search_tile.dart';
import 'package:message_app/screens/test_screen.dart';

class AddFriendScreen extends StatefulWidget {
  const AddFriendScreen({super.key});

  @override
  State<AddFriendScreen> createState() => _AddFriendScrennState();
}

class _AddFriendScrennState extends State<AddFriendScreen> {

  FocusNode myFocus = FocusNode();
  
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    String searchName = "";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Friend",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700
          ),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    focusNode: myFocus,
                    style: const TextStyle(
                      fontSize: 17
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      hintText: "Search",
                      filled: true,
                      fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                      )
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchName=value;
                      });
                    },
                    onTapOutside: (event) => myFocus.unfocus(),
                  ),
                ),
                
                const SizedBox(height: 20,),

                StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('users').snapshots(),
                  builder: (context, snapshots) {
                    if (snapshots.hasData){
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshots.data!.docs.length<=20 ? snapshots.data!.docs.length : 20,
                        itemBuilder: (context, index){
                          var data = snapshots.data!.docs[index].data() as Map<String, dynamic>;
                          if(searchName.isEmpty){
                            return Column(
                              children: [
                                index>=1 ? Divider(color: Colors.black,) : Container(),
                                UsersSearchTile(uid: snapshots.data!.docs[index].id, username: data["username"]),
                              ],);
                          }
                          else if(data['username'].toString().startsWith(searchName.toLowerCase())){
                            return Column(
                              children: [
                                index>=1 ? Divider(color: Colors.black,) : Container(),
                                UsersSearchTile(uid: snapshots.data!.docs[index].id, username: data["username"]),
                              ],);
                          }
                        }
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}