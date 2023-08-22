import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  bool showScreen=true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      setState(() {
        showScreen=false;
      });
      Navigator.of(context).pushReplacementNamed("/tree");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showScreen ? const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.messenger,
                size: 150,
              ),
              Text(
                "Message App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w800
                ),
              ),
              SizedBox(height: 50,)
            ],
          ),
        ],
      ) : Container(),
    );
  }
}