
emailValidation(value){
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
    return "Please enter a valid email address";
  }
  return null;
}
passwordValidation(value){
  if (value.isEmpty) {
    return 'This field is required';
  }
  if (value.length <=6) {
    return null;
  }

}
emptyValidation(value){
  if (value.isEmpty) {
    return 'This field is required';
  }
  return null;

}
mobileValidation(value){
  if (value.isEmpty) {
    return 'This field is required';
  }
  if (value.length <=10) {
    return 'required min 10';
    return null;
  }

}

