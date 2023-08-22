import 'package:flutter/material.dart';

class LogTextField extends StatefulWidget {
  String label;
  bool isPassword;
  TextInputType keyboardType;
  TextEditingController controller;

  LogTextField({
    super.key, 
    required this.label,
    required this.controller,
    this.isPassword=false,
    this.keyboardType=TextInputType.text
  });

  @override
  State<LogTextField> createState() => _LogTextFieldState();
}

class _LogTextFieldState extends State<LogTextField> {

  FocusNode myFcocus = FocusNode();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return TextFormField(
      focusNode: myFcocus,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: widget.isPassword ? hidePassword : false,
      cursorColor: isDarkMode ? Colors.white : Colors.black,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
        focusColor: Colors.black,
        label: Text(
          widget.label
        ),
        suffixIcon: widget.isPassword ? IconButton(
          onPressed: (){
            setState(() {
              hidePassword=!hidePassword;
            });
          },
          icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility, color: isDarkMode ? Colors.white70 : Colors.black87,)
        ) : null
      ),
      onTapOutside: (event) => myFcocus.unfocus(),
    );
  }
}