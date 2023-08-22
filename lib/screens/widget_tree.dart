import 'package:flutter/material.dart';
import 'package:message_app/database/auth.dart';
import 'package:message_app/screens/auth_screen.dart';
import 'package:message_app/screens/home_screen.dart'; 

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return const HomeScreen();
        }else{
          return const AuthScreen();
        }
      },
    );
  }
}