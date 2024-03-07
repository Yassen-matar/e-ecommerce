
bool isEmailValid(String email) {
  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

vailedate(String val, int min, int max, String type) {

  if (type == "email") {
    if (!isEmailValid(val)) {
      return "Enter a correct email";
    }
  }
  if (val.isEmpty) {
    return "No Data";
  }

  if (val.length < min) {
    return "It can't be smaller than $min";
  }

  if (val.length > max) {
    return "It can't be bigger than $max";
  }
}
