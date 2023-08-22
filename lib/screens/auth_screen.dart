import 'package:flutter/material.dart';
import 'package:message_app/screens/login_screen.dart';
import 'package:message_app/screens/register_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  bool isLoginPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoginPage ? const LoginScreen() : const RegisterScreen(),
              const SizedBox(height: 10,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isLoginPage ? "Don't have an account ? " : "Arleady have an account ? ",
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isLoginPage=!isLoginPage;
                          });
                        },
                        child: Text(
                          isLoginPage ? "Register" : "Sign In",
                          style: const TextStyle(
                            decoration: TextDecoration.underline
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}