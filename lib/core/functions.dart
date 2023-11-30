bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

String? validateEmailField(String? email) {
  if (email?.isEmpty ?? true) {
    return 'Field is required';
  } else {
    if(isEmailValid(email!)){
return null;
    }
    else{
      return 'Email format is wrong';
    }
    
  }
  // if (email != null) {
  //   if (isEmailValid(email)) {
  //     return null;
  //   } else {
  //     return 'Email format is wrong';
  //   }
  // } else {
  //   return 'Field is required';
  // }
}

String? validateStringField(value) {
  if (value?.isEmpty ?? true) {
    return 'Field is required';
  } else {
    return null;
  }
}
