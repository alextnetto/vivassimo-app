extension StringExtension on String {
  bool get isStrongPassword {
    return RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$")
        .hasMatch(this);
  }

  bool get isValidPhoneNumber {
    return RegExp(r"^[0-9]{11}$").hasMatch(this);
  }
}
