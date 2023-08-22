import 'package:flutter/material.dart';
import 'package:message_app/components/auth_validator.dart';
import 'package:message_app/components/log_text_field.dart';
import 'package:message_app/database/auth.dart';

class LoginScreen extends StatefulWidget {
  void Function(bool load) setLoading;

  LoginScreen({
    required this.setLoading,
    super.key
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String errorMessage="";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void clearError(String? value){
    setState(() {
      errorMessage="";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
    
          LogTextField(label: "Email", keyboardType: TextInputType.emailAddress, controller: emailController, validator: emailValidator,
            onChanged: clearError,
            prefixIcon: Icons.email_outlined,),
          const SizedBox(height: 20,),
          LogTextField(label: "Password", isPassword: true, keyboardType: TextInputType.visiblePassword, controller: passwordController, validator: passwordValidator,
            onChanged: clearError,
            prefixIcon: Icons.fingerprint_outlined,),
    
          const SizedBox(height: 50,),
    
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: ()async{
                    widget.setLoading(true);
                    if(_formKey.currentState!.validate()){
                      await Auth().signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) {
                        setState(() {
                          errorMessage=value;
                        });
                      });
                      widget.setLoading(false);
                    }
                    
                  },
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
          const SizedBox(height: 10,),
            Visibility(
              visible: errorMessage!="",
              child: Text(
                errorMessage,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.red
                ),
              ),
            )
        ],
      ),
    );
  }
}