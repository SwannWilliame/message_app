import 'package:flutter/material.dart';
import 'package:message_app/components/log_text_field.dart';
import 'package:message_app/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Sign In to your account to continue",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w700
          ),
        ),

        const SizedBox(height: 50,),

        LogTextField(label: "Email", keyboardType: TextInputType.emailAddress, controller: emailController,),
        const SizedBox(height: 20,),
        LogTextField(label: "Password", isPassword: true, keyboardType: TextInputType.visiblePassword, controller: passwordController,),

        const SizedBox(height: 50,),

        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ),
            ),
          ],
        ),
      ],
    );
  }
}