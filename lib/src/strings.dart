class Strings {
  bool is_empty(String value) {
    if (value.length < 1) {
      return true;
    }
    return false;
  }

  String validate_password(String value) {
    if (value.length < 1) {
      return 'Password cannot be empty';
    } else {
      return null;
    }
  }
}
