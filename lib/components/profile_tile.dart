import 'package:flutter/material.dart';
import 'package:message_app/theme/theme_constants.dart';

class ProfileTile extends StatefulWidget {
  String title;
  String data;
  TextEditingController controller;
  String? Function(String? value)? validator;
  TextInputType keyboardType;

  ProfileTile({
    required this.title,
    required this.data,
    required this.controller,
    this.validator,
    this.keyboardType=TextInputType.text,
    super.key
  });

  @override
  State<ProfileTile> createState() => _ProfileTileState();
}

class _ProfileTileState extends State<ProfileTile> {

  bool isEnabled = false;
  FocusNode myFocus=FocusNode();

  @override
  void initState() {
    widget.controller.value = widget.controller.value.copyWith(
      text: widget.data,
      selection: TextSelection.collapsed(offset: widget.data.length)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  var brightness = MediaQuery.of(context).platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(height: 7,),
        GestureDetector(
          onTap: () {
            setState(() {
              isEnabled=true;
            });
          },
          child: TextFormField(
            focusNode: myFocus,
            enabled: isEnabled,
            validator: widget.validator,
            maxLines: widget.keyboardType==TextInputType.multiline ? null : 1,
            maxLength: widget.title=="Username" ? 20 : 100,
            keyboardType: widget.keyboardType,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700
            ),
            controller: widget.controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black)),
              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black, width: 2)),
              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.redAccent)),
              filled: !isEnabled,
              fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[300],
              disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
            ),
            onTapOutside: (event) => myFocus.unfocus(),
          ),
        )
      ],
    );
  }
}