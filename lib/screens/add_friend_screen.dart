import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:message_app/screens/show_users_screen.dart';

class AddFriendScreen extends StatefulWidget {
  const AddFriendScreen({super.key});

  @override
  State<AddFriendScreen> createState() => _AddFriendScrennState();
}

class _AddFriendScrennState extends State<AddFriendScreen> {

  FocusNode myFocus = FocusNode();

  String searchName="";
  TextEditingController controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 40,
                child: TextFormField(
                  controller: controller,
                  focusNode: myFocus,
                  style: const TextStyle(
                    fontSize: 17
                  ),
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ShowUsersScreen(searchName: searchName),));
                      },
                      child: Icon(
                        Icons.search
                      ),
                    ),
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
                  onFieldSubmitted: (value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShowUsersScreen(searchName: value),));
                  },
                  onTapOutside: (event) => myFocus.unfocus(),
                ),
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset("assets/svgs/friends.svg", width: 300,),
            )

          ],
        ),
      ),
    );
  }
}