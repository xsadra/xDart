extension StringExtentions on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+\.[a-zA-Z]');
    return emailRegExp.hasMatch(this);
  }
}

void main() {
  print("It's me!".isValidEmail);
  print('email@sadra.at'.isValidEmail);
}
