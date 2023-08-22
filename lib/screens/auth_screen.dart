import 'package:flutter/material.dart';
import 'package:message_app/database/auth.dart';
import 'package:message_app/screens/login_screen.dart';
import 'package:message_app/screens/register_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  bool isLoginPage = true;
  bool isLoading=false;

  void setLoading(bool load){
    setState(() {
      isLoading=load;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoginPage ? LoginScreen(setLoading: setLoading,) : RegisterScreen(setLoading: setLoading),
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
                ),

                const SizedBox(height: 30,),
                Visibility(
                  visible: isLoading,
                  child: CircularProgressIndicator.adaptive()
                )
            ],
          ),
        ),
      ),
    );
  }
}