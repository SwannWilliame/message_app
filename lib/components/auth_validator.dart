String? emailValidator(String? value){
  if(value==null){
    return "Enter an email";
  }else if(value.isEmpty){
    return "Enter an email";
  }
  return null;
}


String? usernameValidator(String? value){
  if(value==null){
    return "Enter a username";
  }else if(value.isEmpty){
    return "Enter a username";
  }else if(value.length<4 || value.length>20){
    return "username must be between 4 and 20 characters";
  }
  return null;
}

String? passwordValidator(String? value){
  if(value==null){
    return "Enter a password";
  }else if(value.isEmpty){
    return "Enter a password";
  }else if(value.length<6){
    return "Password must be 6+ characters long";
  }
  return null;
}