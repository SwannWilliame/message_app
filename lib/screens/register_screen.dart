import 'package:flutter/material.dart';
import 'package:message_app/components/log_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController useranameController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Register a new account !",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w700
          ),
        ),
    
        const SizedBox(height: 50,),
    
        LogTextField(label: "Username", controller: useranameController, keyboardType: TextInputType.name,),
        const SizedBox(height: 15,),
        LogTextField(label: "Email", controller: emailController, keyboardType: TextInputType.emailAddress,),
        const SizedBox(height: 15,),
        LogTextField(label: "Password", controller: passwordController, keyboardType: TextInputType.visiblePassword, isPassword: true,),
        const SizedBox(height: 15,),
    
        const SizedBox(height: 30,),
    
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
                    "Register",
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