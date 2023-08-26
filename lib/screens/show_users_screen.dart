import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:message_app/components/users_search_tile.dart';

class ShowUsersScreen extends StatefulWidget {
  String searchName;

  ShowUsersScreen({
    required this.searchName,
    super.key
  });

  @override
  State<ShowUsersScreen> createState() => _ShowUsersScreenState();
}

class _ShowUsersScreenState extends State<ShowUsersScreen> {

  @override
  void initState() {
    print(widget.searchName);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, AsyncSnapshot snapshots) {
            String searchName = widget.searchName;
            if (snapshots.hasData){
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshots.data!.docs.length<=20 ? snapshots.data!.docs.length : 20,
                itemBuilder: (context, index){
                  var data = snapshots.data!.docs[index].data() as Map<String, dynamic>;
                  if(searchName==""){
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
                  return Container();
                }
              );
            }

            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}