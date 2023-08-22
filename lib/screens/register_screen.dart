import 'package:flutter/material.dart';
import 'package:message_app/components/auth_validator.dart';
import 'package:message_app/components/log_text_field.dart';
import 'package:message_app/database/auth.dart';

class RegisterScreen extends StatefulWidget {
  void Function(bool load) setLoading;

  RegisterScreen({
    required this.setLoading,
    super.key
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    useranameController.dispose();
    super.dispose();
  }

  String errorMessage="";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController useranameController = TextEditingController();

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
            "Register a new account !",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w700
            ),
          ),
      
          const SizedBox(height: 50,),
      
          LogTextField(
            label: "Username", 
            controller: useranameController, 
            keyboardType: TextInputType.name,
            validator: usernameValidator,
            onChanged: clearError,
            prefixIcon: Icons.person_outline,
          ),
          const SizedBox(height: 15,),
          LogTextField(
            label: "Email", 
            controller: emailController, 
            keyboardType: TextInputType.emailAddress,
            validator: emailValidator,
            onChanged: clearError,
            prefixIcon: Icons.email_outlined,
          ),
          const SizedBox(height: 15,),
          LogTextField(
            label: "Password", 
            controller: passwordController, 
            keyboardType: TextInputType.visiblePassword, 
            isPassword: true,
            validator: passwordValidator,
            onChanged: clearError,
            prefixIcon: Icons.fingerprint_outlined,
          ),
          const SizedBox(height: 15,),
      
          const SizedBox(height: 30,),
      
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: ()async{
                    widget.setLoading(true);
                    if(_formKey.currentState!.validate()){
                      await Auth().createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text, username: useranameController.text).then((value) {
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
          ),

        ],
      ),
    );
  }
}